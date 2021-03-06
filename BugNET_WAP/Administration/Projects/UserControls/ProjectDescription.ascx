<%@ Control Language="c#" Inherits="BugNET.Administration.Projects.UserControls.ProjectDescription" CodeBehind="ProjectDescription.ascx.cs" %>
<%@ Register TagPrefix="it" TagName="PickSingleUser" Src="~/UserControls/PickSingleUser.ascx" %>

<h2>
    <asp:Literal ID="DetailsTitle" runat="Server" meta:resourcekey="DetailsTitle" /></h2>
<asp:Label ID="lblError" ForeColor="red" EnableViewState="false" runat="Server" />
<p class="desc">
    <asp:Label ID="Label9" runat="server" meta:resourcekey="ProjectDescription" Text="Enter the details for the project." />
</p>
<div class="form-horizontal">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" HeaderText="<%$ Resources:SharedResources, ValidationSummaryHeaderText %>" CssClass="validationSummary" />

    <div class="form-group">
        <asp:Label ID="Label1" AssociatedControlID="txtName" meta:resourcekey="ProjectName" CssClass="col-md-2 control-label" runat="server" Text="Project Name:" />
        <div class="col-md-10">
            <asp:TextBox ID="txtName" CssClass="form-control" runat="Server" />
            <asp:RequiredFieldValidator Text="<%$ Resources:SharedResources, Required %>"
                SetFocusOnError="True" ErrorMessage="Project Name is required" meta:resourcekey="ProjectNameRequiredFieldValidator"
                ControlToValidate="txtName" runat="server" ID="ProjectNameRequiredFieldValidator" />
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label2" AssociatedControlID="ProjectDescriptionHtmlEditor" CssClass="col-md-2 control-label" meta:resourcekey="Description"
            Text="Description:" runat="server" />
        <div class="col-md-10">
            <bn:HtmlEditor ID="ProjectDescriptionHtmlEditor" runat="server" />
            <asp:RequiredFieldValidator Text="<%$ Resources:SharedResources, Required %>" ErrorMessage="Description is required" Display="Dynamic"
                SetFocusOnError="True" ControlToValidate="ProjectDescriptionHtmlEditor" runat="server" ID="RequiredFieldValidator2" />
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label3" AssociatedControlID="ProjectCode" meta:resourcekey="ProjectCodeLabel" CssClass="col-md-2 control-label" runat="server" Text="Project Code:" />
        <div class="col-md-10">
            <asp:TextBox ID="ProjectCode" CssClass="form-control" runat="Server" />
            <asp:RequiredFieldValidator Text="<%$ Resources:SharedResources, Required %>"
                ControlToValidate="ProjectCode" meta:resourcekey="ProjectCodeValidator" runat="server" ID="RequiredFieldValidator3" />
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label6" AssociatedControlID="ProjectManager" runat="server" CssClass="col-md-2 control-label" meta:resourcekey="ProjectManagerLabel" Text="Manager:" />
        <div class="col-md-10">
            <asp:DropDownList ID="ProjectManager" CssClass="form-control" DataTextField="DisplayName" DataValueField="Username" runat="Server" />
            <asp:RequiredFieldValidator Text="<%$ Resources:SharedResources, Required %>" InitialValue=""
                ControlToValidate="ProjectManager" runat="server" ID="RequiredFieldValidator4" meta:resourcekey="ProjectManagerValidator" />
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label7" AssociatedControlID="chkAllowIssueVoting" runat="server" CssClass="col-md-2 control-label" meta:resourcekey="AllowIssueVotingLabel" Text="Allow Issue Voting:"></asp:Label>
        <div class="col-md-10">
            <div class="checkbox">
                <asp:CheckBox Checked="true" ID="chkAllowIssueVoting" runat="server" />
            </div>
        </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label11" AssociatedControlID="ProjectImageUploadFile" CssClass="col-md-2 control-label" runat="server" meta:resourcekey="ProjectImageLabel" Text="Project Image:"></asp:Label>
        <div class="col-md-5">
            <asp:FileUpload ID="ProjectImageUploadFile" runat="server" />
        </div>
        <div class="col-md-3">
            <asp:Image runat="server" ID="ProjectImage" Height="62" Width="62" />
            <br />
            <asp:LinkButton ID="RemoveProjectImage" runat="server" Text="<%$ Resources:SharedResources, Remove %>" OnClick="RemoveProjectImage_Click"></asp:LinkButton>
        </div>
    </div>
    <h3><asp:Literal ID="Literal1" runat="Server" meta:resourcekey="SecurityTitle" /></h3>
    <div class="form-group">
        <asp:Label ID="Label8" AssociatedControlID="rblAccessType" meta:resourcekey="AccessTypeLabel"
            CssClass="col-md-2 control-label" runat="server" Text="Access Type:"></asp:Label>
        <div class="col-md-10">
            <asp:RadioButtonList  RepeatLayout="Flow" ID="rblAccessType" CssClass="radio" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem Value="Public" meta:resourcekey="PublicListItem" />
                <asp:ListItem Value="Private" Selected="True" meta:resourcekey="PrivateListItem" />
            </asp:RadioButtonList>
        </div>
    </div>
    <h3><asp:Literal ID="Literal2" runat="Server" meta:resourcekey="IssueAttachmentsTitle" /></h3>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="form-group">
                <asp:Label ID="Label4" AssociatedControlID="AllowAttachments"
                    CssClass="col-md-2 control-label" runat="server" meta:resourcekey="EnableAttachmentsLabel" Text="Enable Attachments:"></asp:Label>
                <div class="col-md-10">
                    <div class="checkbox">
                        <asp:CheckBox CssClass="inputCheckBox" ID="AllowAttachments" AutoPostBack="true" OnCheckedChanged="AllowAttachmentsChanged" runat="server" />
                    </div>
                </div>
            </div>

            <div class="form-group" id="AttachmentStorageTypeRow" runat="server" visible="false">
                <asp:Label ID="Label10" CssClass="col-md-2 control-label"
                    AssociatedControlID="AttachmentStorageType" meta:resourcekey="AttachmentStorageTypeLabel" runat="server" Text="Storage Type:"></asp:Label>
                <div class="col-md=8">
                    <asp:RadioButtonList ID="AttachmentStorageType" RepeatLayout="Flow" OnSelectedIndexChanged="AttachmentStorageType_Changed" RepeatDirection="Horizontal" AutoPostBack="true" runat="server">
                        <asp:ListItem Text="Database (recommended)" Selected="True" Value="2" meta:resourcekey="AttachmentStorageTypeDb" />
                        <asp:ListItem Text="File System" Value="1" meta:resourcekey="AttachmentStorageTypeFs" />
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="form-group" id="AttachmentUploadPathRow" runat="server" visible="false">
                <asp:Label CssClass="col-md-2 control-label" ID="Label5" AssociatedControlID="txtUploadPath" meta:resourcekey="UploadPath" runat="server" Text="Upload Path:" />
                <div class="col-md-10">
                    ~\Uploads\&nbsp;
                        
                        <asp:TextBox ID="txtUploadPath" Width="300px" runat="Server" Text="" />
                    <asp:CustomValidator ID="validUploadPath" runat="server"
                        ControlToValidate="txtUploadPath"
                        OnServerValidate="validUploadPath_ServerValidate">Upload path is not valid</asp:CustomValidator>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

