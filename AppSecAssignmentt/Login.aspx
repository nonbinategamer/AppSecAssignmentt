<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AppSecAssignmentt.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <script src="https://www.google.com/recaptcha/api.js?render=6LfvSWoeAAAAALlV_ZPk0crz3PYSwnS7-t9oD9ZS"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <fieldset>
                <legend>Login</legend>
                <p>Username: 
                    <asp:TextBox ID="tb_userid" runat="server" Width="143px"></asp:TextBox>
                </p>
                <p>Password: 
                    <asp:TextBox ID="tb_password" runat="server" TextMode="Password" Width="144px"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="btn_login" runat="server" OnClick="Button1_Click" Text="Login" Width="64px"/>&nbsp;
                    <asp:Button ID="btn_reg" runat="server" OnClick="btn_reg_Click" Text="Register" />
                </p>
                <p>
                    <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response"/>
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </p>
            </fieldset>
        </div>
    </form>
<script>
    grecaptcha.ready(function () {
        grecaptcha.execute('6LfvSWoeAAAAALlV_ZPk0crz3PYSwnS7-t9oD9ZS', { action: 'Login' }).then(function (token) {
            document.getElementById("g-recaptcha-response").value = token;
        });
    });
</script>
</body>
</html>
