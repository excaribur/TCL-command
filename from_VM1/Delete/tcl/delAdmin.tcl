tcl;
mql set context user creator;
mql verbose on;
mql -k del role ESP
mql -k del role ESP_Employee
mql -k del role ESP_Manager
mql -k del prog ESP_CommonDocumentService
mql -k del prog ESP_Trigger
mql -k del form ESP_formDocReq
mql -k del form ESP_formDocPub
mql -k del form ESP_formDocClass
mql -k del command ESP_Add_ESP_DOC
mql -k del command ESP_Approve_DOC
mql -k del command ESP_Check_Request
mql -k del command ESP_Create_ClassDoc
mql -k del command ESP_Create_PubDoc
mql -k del command ESP_Create_Req
mql -k del command ESP_DocRelate
mql -k del command ESP_My_CheckReq
mql -k del command ESP_MyDoc
mql -k del command ESP_MyDocRel_Remove
mql -k del command ESP_MyDocRel_Add
mql -k del command ESP_MyDocRelate
mql -k del command ESP_Reject_DOC
mql -k del command ESP_Doc_Del
mql -k del menu ESP_DocManage
mql -k del menu ESP_MyCheckReqDel_toolbar
mql -k del menu ESP_MyCheckReqRel_toolbar
mql -k del menu ESP_MyDocDel_toolbar
mql -k del menu ESP_MyDocRel_toolbar
mql -k del menu ESP_MyESPDoc
mql -k del menu type_ESP_Doc_Classified
mql -k del menu type_ESP_Doc_Public
mql -k del table ESP_Check_Request_table system
mql -k del table ESP_MyDoc_table system
mql -k del table ESP_RelateDoc_table system
mql -k del table ESP_MyDocAdd_table system
mql -k del table ESP_MyDocRelate_table system
mql -k del relation ESP_Doc_CheckRequest
mql -k del relation ESP_ESP_Doc_to_Doc
mql -k del policy ESP_Doc_CheckReq_State
mql -k del policy ESP_Doc_Class_State
mql -k del policy ESP_Doc_Pub_State
mql -k del policy ESP_Doc_State
mql -k del type ESP_Doc_CheckRequest
mql -k del type ESP_Doc_Classified
mql -k del type ESP_Doc_Public
mql -k del type ESP_Document
mql -k del attribute ESP_Approver
mql -k del attribute ESP_DocumentDescription
mql -k del attribute ESP_DocumentID
mql -k del attribute ESP_DocumentName
mql -k del attribute ESP_DocumentProject
mql -k del attribute ESP_DocumentTopic
