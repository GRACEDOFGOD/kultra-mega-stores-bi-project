# kms_dashboard.py

import streamlit as st
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.express as px

st.set_page_config(layout="wide")

# Load the CSV
st.title("📊 Kultra Mega Stores - BI Dashboard")
uploaded_file = st.file_uploader("Upload your cleaned KMS .csv file", type=["csv"])

if uploaded_file:
    df = pd.read_csv(uploaded_file)
    df['OrderDate'] = pd.to_datetime(df['OrderDate'])

    # Sidebar filters
    st.sidebar.header("🔍 Filter Options")
    region_filter = st.sidebar.multiselect("Select Region(s)", df['Region'].unique(), default=df['Region'].unique())
    segment_filter = st.sidebar.multiselect("Select Segment(s)", df['CustomerSegment'].unique(), default=df['CustomerSegment'].unique())

    df = df[(df['Region'].isin(region_filter)) & (df['CustomerSegment'].isin(segment_filter))]

    # Overview metrics
    st.metric("Total Sales", f"${df['Sales'].sum():,.2f}")
    st.metric("Total Profit", f"${df['Profit'].sum():,.2f}")
    st.metric("Total Orders", f"{df['OrderID'].nunique()}")

    # Layout columns
    col1, col2 = st.columns(2)

    with col1:
        fig = px.bar(df, x='Region', y='Sales', color='Region', title='Sales by Region')
        st.plotly_chart(fig, use_container_width=True)

    with col2:
        fig2 = px.pie(df, names='CustomerSegment', title='Customer Segment Distribution')
        st.plotly_chart(fig2, use_container_width=True)

    st.markdown("---")

    # Sales trend
    st.subheader("📈 Monthly Sales Trend")
    monthly = df.groupby(df['OrderDate'].dt.to_period("M"))['Sales'].sum().reset_index()
    monthly['OrderDate'] = monthly['OrderDate'].dt.to_timestamp()
    st.line_chart(monthly.set_index('OrderDate'))

    st.markdown("---")

    # Correlation heatmap
    st.subheader("📌 Correlation Matrix")
    num_cols = ['Sales', 'Profit', 'Discount', 'ShippingCost', 'OrderQuantity']
    corr = df[num_cols].corr()
    fig3, ax = plt.subplots()
    sns.heatmap(corr, annot=True, cmap='coolwarm', ax=ax)
    st.pyplot(fig3)

    st.markdown("---")

    # Top products
    st.subheader("🏆 Top Product Categories by Sales")
    top_products = df.groupby('ProductCategory')['Sales'].sum().sort_values(ascending=False).head(10)
    st.bar_chart(top_products)
