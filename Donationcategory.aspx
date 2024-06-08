<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Donationcategory.aspx.cs" Inherits="fyp3.Donationcategory" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://seramount.com/wp-content/uploads/images/2017/07/hc-ed-more-philanthropy-needed-in-hartford-region-20141007.jpg'); /* Specify the path to your background image */
            background-size: cover; /* Cover the entire body */
            background-position: center; /* Center the background image */
        }

        .navbar {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            text-align: left; /* Align links to the left */
            display: flex;
            align-items: center;
        }
        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex; /* Use flexbox to align items */
            justify-content: space-between; /* Space items evenly */
        }
        .navbar ul li {
            display: inline;
        }
        .navbar ul li a {
            text-decoration: none;
            color: #fff;
            margin-left: 100px; /* Add space between links */
        }
        .container {
            padding: 20px;
            text-align: center; /* Center the containers */
        }
        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
        }

        /* Style for small containers */
    .small-container {
    display: inline-block;
    width: 190px;
    height: 240px; /* Increase the height to accommodate both upper and lower sections */
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin: 0 10px;
    overflow: hidden; /* Hide any overflow content */
    position: relative; /* Set position relative to allow absolute positioning */
}

.small-container img {
    width: 100%; /* Make the image fill the entire width of the container */
    height: 50%; /* Adjust the height to fill half of the container */
    object-fit: cover; /* Ensure the image covers the entire container */
}

.bottom-section {
    position: absolute; /* Position the bottom section relative to its container */
    bottom: 0; /* Align the bottom of the bottom section to the bottom of the container */
    left: 0; /* Align the bottom section to the left of the container */
    width: 100%; /* Make the bottom section fill the entire width of the container */
    background-color: rgba(255, 255, 255, 0.7); /* Add a semi-transparent background color */
    padding: 5px; /* Add padding to the bottom section */
}


        .auto-style1 {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            position: fixed;
            bottom: 0;
            width: 101%;
            text-align: center;
            left: -18px;
        }
        
        .donate-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff; /* Change color to your preference */
    color: #fff; /* Text color */
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

.donate-button:hover {
    background-color: #0056b3; /* Darker color on hover */
}



        .auto-style5 {
            height: 14px;
        }
        .auto-style7 {
            padding: 20px;
            text-align: center;
            height: 795px;
        }

        .add-container {
    margin-bottom: 20px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
   
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
}

.form-control {
    width: calc(80% - 24pxpx); /* Adjusting for padding */
    padding: 10px 12px; /* Padding to match Bootstrap */
    font-size: 16px;
    border: 1px solid #ced4da; /* Bootstrap-like border */
    border-radius: 4px;
    box-sizing: border-box; /* Adjusting for padding and border */
}

.btn {
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    background-color: #007bff; /* Bootstrap-like primary button color */
    color: white; /* Text color */
}

.btn:hover {
    background-color: #0056b3; /* Darker shade on hover */
}

.btn:active {
    background-color: #0040a1; /* Even darker shade when active */
}

  .auto-style3 {
      width: 50px; /* Adjust width as needed */
      height: 45px; /* Adjust height as needed */
      margin-right: 10px; /* Adjust margin as needed */
  }



    </style>
</head>
<body style="height: 1260px">
    <form id="form1" runat="server">
       <div class="navbar">
    <img src="https://visionsvcb.org/wp-content/uploads/2020/03/donate-icon.png" alt="Website Icon" class="auto-style3">
    <ul>
        <li><a href="Homepage.aspx">Home</a></li>
        <li><a href="Donationcategory.aspx">Donations</a></li>
        <li><a href="contact.aspx">Contact</a></li>
        <li style="margin-left: auto;"><a href="login.aspx">Log Out</a></li>
    </ul>
</div>
    <div class="container">
        <h1>
            <asp:Label ID="Label1" runat="server" BackColor="Black" Padding="20px" BorderColor="Blue" BorderWidth="2px" ForeColor="White" Text="Wakaf Tunai Donation"></asp:Label>
        </h1>
        <h1>Your help is needed</h1>
        <p></p>
    </div>
    <div class="auto-style7">
       
<% if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"]) { %>
    <div class="add-container">
        <h2>Add New Donation Container</h2>
        <div class="form-group">
            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Name"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtImageUrl">Image URL:</label>
            <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" Placeholder="Image URL"></asp:TextBox>
        </div>
        <asp:Button ID="btnAddContainer" runat="server" Text="Add Container" OnClick="btnAddContainer_Click" CssClass="btn btn-primary" />
    </div>
    <br />
<% } %>


      <!-- Donation Containers -->
<div class="donation-containers">
    <asp:Repeater ID="rptDonationContainers" runat="server">
        <ItemTemplate>
            <div class="small-container">
                <div class="upper-section">
                    <img src='<%# Eval("ImageUrl") %>' alt="Image">
                </div>
                <div class="lower-section">
                    <h3><%# Eval("Name") %></h3>
                    <% if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"]) { %>
                        <asp:Button ID="btnEdit" runat="server" CommandArgument='<%# Eval("IdNum") %>' Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-secondary" />
                        <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Eval("IdNum") %>' Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-danger" />
                    <% } else { %>
                        <a href="login.aspx" class="donate-button">Donate</a>
                    <% } %>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

    </div>

            

    <div class="auto-style1">
        <p>&copy; 2024 MyDonation. All rights reserved.</p>
    </div>
    </form>
</body>
</html>

