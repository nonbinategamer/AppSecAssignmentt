﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AppSecAssignmentt.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <legend>HomePage</legend>

                <br />

                <asp:Label ID="lblmessage" runat="server" EnableViewState="false" />
                <br />
                <br />

                <asp:Button ID="btn_logout" runat="server" Text="Logout" OnClick="Button1_Click" Visible="false" />

            </fieldset>
        </div>
    </form>
</body>
</html>
