tcl;
mql set context user creator;
mql verbose on;
mql del role ESP
mql del role ESP_Manager
mql del prog ESP_CommonDocumentService
mql del prog ESP_Trigger
mql del form ESP_formDocReq
mql del form ESP_formDocPub
mql del form ESP_formDocClass
mql del command ESP_Add_ESP_DOC
mql del command ESP_Approve_DOC
mql del command ESP_Check_Request
mql del command ESP_Create_ClassDoc
mql del command ESP_Create_PubDoc
mql del command ESP_Create_Req
mql del command ESP_DocRelate
mql del command ESP_My_CheckReq
mql del command ESP_MyDoc
mql del command ESP_MyDocRel_Add
mql del command ESP_MyDocRel_Remove
mql del command ESP_MyDocRelate
mql del command ESP_Reject_DOC
mql del command ESP_Doc_Del
mql del menu ESP_DocManage
mql del menu ESP_MyCheckReqDel_toolbar
mql del menu ESP_MyCheckReqRel_toolbar
mql del menu ESP_MyDocDel_toolbar
mql del menu ESP_MyDocRel_toolbar
mql del menu ESP_MyESPDoc
mql del menu type_ESP_Doc_Classified
mql del menu type_ESP_Doc_Public
mql del table ESP_Check_Request_table system
mql del table ESP_MyDoc_table system
mql del table ESP_RelateDoc_table system
mql del table ESP_MyDocAdd_table system
mql del table ESP_MyDocRelate_table system
mql del relation ESP_Doc_CheckRequest
mql del policy ESP_Doc_CheckReq_State
mql del policy ESP_Doc_Class_State
mql del policy ESP_Doc_Pub_State
mql del policy ESP_Doc_State
mql del type ESP_Doc_CheckRequest
mql del type ESP_Doc_Classified
mql del type ESP_Doc_Public
mql del type ESP_Document
mql del attribute ESP_Approver
mql del attribute ESP_DocumentDescription
mql del attribute ESP_DocumentID
mql del attribute ESP_DocumentName
mql del attribute ESP_DocumentProject
mql del attribute ESP_DocumentTopic
