<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="AppSecAssignmentt.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Registration</title>

    <script type="text/javascript">
        function pwd_validate() {
            var str = document.getElementById('<%=tb_password.ClientID %>').value;

            if (str.length < 12) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password length must be at least 12 characters long";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("too_short");
            }

            else if (str.search(/[0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password must have at least 1 number";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_number");
            }

            else if (str.search(/[A-Z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password must have an upper case character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_uppcase");
            }

            else if (str.search(/[a-z]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password must have a lower case character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_lowcase");
            }

            else if (str.search(/[^a-zA-Z0-9]/) == -1) {
                document.getElementById("lbl_pwdchecker").innerHTML = "Password must have at least 1 special character";
                document.getElementById("lbl_pwdchecker").style.color = "Red";
                return ("no_spechar");
            }


            document.getElementById("lbl_pwdchecker").innerHTML = "Excellent"
            document.getElementById("lbl_pwdchecker").style.color = "Blue";

        }
    </script>
    <script>
        function fname_validate() {
            var str = document.getElementById('<%=tb_fname.ClientID %>').value;

            if (str.length == 0) {
                document.getElementById("lbl_fnamechecker").innerHTML = "First Name is required";
                document.getElementById("lbl_fnamechecker").style.color = "Red";
                return ("no_name");
            }
        }
    </script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 139px;
        }
        .auto-style3 {
            width: 139px;
            height: 17px;
        }
        .auto-style4 {
            height: 17px;
        }
    </style>
</head>
<body style="height: 275px">
    <form id="form1" runat="server">
        <div>
            <strong>Registration<br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </strong>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">First Name:</td>
            <strong>
                    <td class="auto-style4">
                        <asp:TextBox ID="tb_fname" runat="server" onkeyup="javascript:fname_validate()"></asp:TextBox>
            <strong>
                        <asp:Label ID="lbl_fnamechecker" runat="server"></asp:Label>
                </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name:</td>
                    <td>
            <strong>
                        <asp:TextBox ID="tb_lname" runat="server" onkeyup="javascript:lname_validate()"></asp:TextBox>
                        <asp:Label ID="lbl_lnamechecker" runat="server"></asp:Label>
                </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Email:</td>
                    <td>
            <strong>
                        <asp:TextBox ID="tb_email" runat="server" onkeyup="javascript:email_validate()"></asp:TextBox>
                        <asp:Label ID="lbl_emailchecker" runat="server"></asp:Label>
                </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Credit Card:</td>
                    <td>
            <strong>
                        <asp:TextBox ID="tb_cc" runat="server" onkeyup="javascript:cc_validate()"></asp:TextBox>
                        <asp:Label ID="lbl_ccchecker" runat="server"></asp:Label>
                </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Password:</td>
                    <td>
            <strong>
                        <asp:TextBox ID="tb_password" runat="server" onkeyup="javascript:pwd_validate()" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lbl_pwdchecker" runat="server"></asp:Label>
                </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Confirm Password:</td>
                    <td>
            <strong>
                        <asp:TextBox ID="tb_cfpassword" runat="server" onkeyup="javascript:cfpwd_validate()" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lbl_cfpwdchecker" runat="server"></asp:Label>
                </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Date of Birth:</td>
                    <td>
            <strong>
                        <asp:TextBox ID="tb_dob" runat="server" onkeyup="javascript:dob_validate()"></asp:TextBox>
                        <asp:Label ID="lbl_dobchecker" runat="server"></asp:Label>
                </strong></td>
                </tr>
                <tr>
                    <td class="auto-style2">Upload Photo</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <strong>
                <asp:Button ID="btn_reg" runat="server" OnClick="Button1_Click" Text="Register" Width="128px" />
                </strong>
                    </td>
                </tr>
            </table>
                </strong>
        </div>
    </form>
</body>
</html>
