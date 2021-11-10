-- **********************************************************************************************
-- File Name	: 02CreateTable.sql
-- Function		: �������ݱ�
-- CreateDate	: 2021-05-06
-- Creator		: 
-- Modify		:
-- **********************************************************************************************
USE [MPS]
GO





/***********************************************************************************************
ϵͳ����
	�û�����
	��ɫ����
	�˵�����
	���Ź���
	�ֵ����
	��������
	�������
	��־����

��Ϣ����
	��Ƶ����
	��Ƶ����
	��Ŀ������ɾ�Ĳ顢������ã�
		��Ŀcode=>(��Ʒproduct, ����news, ��Ƹrecruit, ��������abouts, ��ϵ����contact, ����case, ֤��cert) -- ���ֵ�
	���¹���
	����ͶƱ
	��������

��Ʒ����
	��Ʒ����
	��Ʒ��Ϣ
	��Ʒ����
	��������
	��Ϣ֪ͨ

�ͻ�����
	�ÿ͹���
	�̻�����
	��Ա�ȼ�
	��Ա�ɳ�
	��ԱȨ��
	��Ա��ǩ
	��Ա����
***********************************************************************************************/





/***********************************************************************************************
ϵͳ����
	�û�����
	��ɫ����
	�˵�����
	���Ź���
	�ֵ����
	��������
	�������
	��־����
***********************************************************************************************/

-- **********************************************************************************************
-- ��    ��	: TbSysUser
-- ��    ��	: �û���Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysUser') IS NOT NULL
BEGIN
	DROP TABLE TbSysUser
	PRINT '<<< DROPPER TABLE TbSysUser! >>>'
END
GO
CREATE TABLE TbSysUser
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Account					VARCHAR(50) NOT NULL,	--�˺�
	[Password]				VARCHAR(300),			--��¼����
	RealName				NVARCHAR(100),			--��ʵ����
	Gender					CHAR(1),				--�Ա�[M�С�FŮ��Uδ֪]
	Avatar					VARCHAR(2000),			--ͷ��
	Mobile					VARCHAR(50),			--�ֻ���
	LinkTel					VARCHAR(50),			--��ϵ�绰
	LinkAddress				NVARCHAR(500),			--��ϵ��ַ
	Birthday				DATETIME,				--��������
	IdCardNo				VARCHAR(50),			--���֤��
	Email					VARCHAR(200),			--����
	Wechat					VARCHAR(50),			--΢�ź�
	QQ						VARCHAR(50),			--QQ��
	UserState				INT,					--�û�״̬[0ͣ�á�1���2����]
	RegisterTime			DATETIME,				--ע��ʱ��,
	WorkNo					VARCHAR(50),			--����
	DepartId				VARCHAR(32),			--���ڲ���Id
	DepartName				NVARCHAR(50),			--���ڲ�������
	JobId					VARCHAR(50),			--����ְλ�ֵ�ֵ
	JobName					VARCHAR(100),			--����ְλ�ֵ��ǩ
	HireTime				DATETIME,				--��ְʱ��
	SignPic					VARCHAR(2000),			--����ǩ��ͼƬ
	LastLoginTime			DATETIME,				--�ϴε�¼ʱ��
	IsAdmin					INT,					--�Ƿ����Ա[0��1��]
	Remark					NVARCHAR(2000),			--��ע
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysUser_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysUser') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysUser SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysUser! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysUserState
-- ��    ��	: �û�״̬�����
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysUserState') IS NOT NULL
BEGIN
	DROP TABLE TbSysUserState
	PRINT '<<< DROPPER TABLE TbSysUserState! >>>'
END
GO
CREATE TABLE TbSysUserState
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	UserId					VARCHAR(32) NOT NULL,	--����û�Id
	UserState				INT,					--�������û�״̬
	ChangeReason			NVARCHAR(200),			--���ԭ��
	ChangeTime				DATETIME,				--���ʱ��
	OperaterId				VARCHAR(32),			--�����û�Id
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysUserState_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysUserState') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysUserState SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysUserState! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysUserRole
-- ��    ��	: �û���ɫ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysUserRole') IS NOT NULL
BEGIN
	DROP TABLE TbSysUserRole
	PRINT '<<< DROPPER TABLE TbSysUserRole! >>>'
END
GO
CREATE TABLE TbSysUserRole
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	UserId					VARCHAR(32),			--�û�Id
	RoleId					VARCHAR(32),			--��ɫId
	CONSTRAINT PK_TbSysUserRole_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysUserRole') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysUserRole SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysUserRole! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysRole
-- ��    ��	: ��ɫ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysRole') IS NOT NULL
BEGIN
	DROP TABLE TbSysRole
	PRINT '<<< DROPPER TABLE TbSysRole! >>>'
END
GO
CREATE TABLE TbSysRole
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	RoleName				NVARCHAR(50) NOT NULL,	--��ɫ����
	RoleDesc				NVARCHAR(1000),			--����
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysRole_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysRole') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysRole SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysRole! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysMenu
-- ��    ��	: �˵���Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysMenu') IS NOT NULL
BEGIN
	DROP TABLE TbSysMenu
	PRINT '<<< DROPPER TABLE TbSysMenu! >>>'
END
GO
CREATE TABLE TbSysMenu
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Pid						VARCHAR(32) NOT NULL,	--���ڵ�Id
	MenuName				NVARCHAR(50) NOT NULL,	--�˵�����
	MenuCode				VARCHAR(20),			--�˵����
	MenuLevel				INT,					--�㼶
	MenuIcon				VARCHAR(100),			--��ʾͼ��
	MenuRoute				VARCHAR(1000),			--·�ɵ�ַ
	MenuState				INT,					--�˵�״̬[0:���á�1:����]
	Remark					NVARCHAR(2000),			--��ע
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysMenu_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysMenu') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysMenu SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysMenu! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysRoleMenu
-- ��    ��	: ��ɫ�˵���
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysRoleMenu') IS NOT NULL
BEGIN
	DROP TABLE TbSysRoleMenu
	PRINT '<<< DROPPER TABLE TbSysRoleMenu! >>>'
END
GO
CREATE TABLE TbSysRoleMenu
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	RoleId					VARCHAR(32),			--��ɫId
	MenuId					VARCHAR(32),			--�˵�Id
	CONSTRAINT PK_TbSysRoleMenu_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysRoleMenu') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysRoleMenu SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysRoleMenu! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysDepart
-- ��    ��	: ������Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysDepart') IS NOT NULL
BEGIN
	DROP TABLE TbSysDepart
	PRINT '<<< DROPPER TABLE TbSysDepart! >>>'
END
GO
CREATE TABLE TbSysDepart
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Pid						VARCHAR(32) NOT NULL,	--���ڵ�Id
	DepartName				NVARCHAR(50),			--��������
	DepartCode				VARCHAR(20),			--���ű��
	Director				NVARCHAR(50),			--���Ÿ�����
	Mobile					VARCHAR(50),			--�������ֻ���
	DepartState				INT,					--����״̬[0:ͣ�á�1:����]
	StaffCount				INT,					--��������
	Remark					NVARCHAR(2000),			--��ע
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysDepart_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysDepart') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysDepart SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysDepart! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysDict
-- ��    ��	: �ֵ���Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysDict') IS NOT NULL
BEGIN
	DROP TABLE TbSysDict
	PRINT '<<< DROPPER TABLE TbSysDict! >>>'
END
GO
CREATE TABLE TbSysDict
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	DictName				NVARCHAR(50) NOT NULL,	--�ֵ�����
	DictDesc				NVARCHAR(1000),			--����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysDict_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysDict') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysDict SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysDict! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysDictDetail
-- ��    ��	: �ֵ������
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysDictDetail') IS NOT NULL
BEGIN
	DROP TABLE TbSysDictDetail
	PRINT '<<< DROPPER TABLE TbSysDictDetail! >>>'
END
GO
CREATE TABLE TbSysDictDetail
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	DictId					VARCHAR(32) NOT NULL,	--�ֵ�Id
	DictLabel				VARCHAR(100),			--�ֵ��ǩ
	DictValue				VARCHAR(50),			--�ֵ�ֵ
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysDictDetail_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysDictDetail') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysDictDetail SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysDictDetail! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysArea
-- ��    ��	: ����������
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysArea') IS NOT NULL
BEGIN
	DROP TABLE TbSysArea
	PRINT '<<< DROPPER TABLE TbSysArea! >>>'
END
GO
CREATE TABLE TbSysArea
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Pid						VARCHAR(32) NOT NULL,	--���ڵ�Id
	AreaName				NVARCHAR(50),			--��������
	ShortName				NVARCHAR(50),			--���
	AreaType				INT,					--��������[1����2ʡ��3�С�4��/��]
	AreaCode				VARCHAR(50),			--��������
	AreaZone				VARCHAR(20),			--����
	PostalCode				VARCHAR(10),			--��������
	AreaDesc				NVARCHAR(1000),			--����
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysArea_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysArea') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysArea SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysArea! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysNotice
-- ��    ��	: ϵͳ�����
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysNotice') IS NOT NULL
BEGIN
	DROP TABLE TbSysNotice
	PRINT '<<< DROPPER TABLE TbSysNotice! >>>'
END
GO
CREATE TABLE TbSysNotice
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	NoticeTitle				NVARCHAR(200) NOT NULL,	--�������
	NoticeContent			NVARCHAR(MAX),			--��������
	IsReleased				INT,					--�Ƿ񷢲�[0:��1:��]
	Releaser				VARCHAR(32),			--������ID
	ReleaserName			NVARCHAR(50),			--����������
	ReleaserDepart			NVARCHAR(50),			--���������ڲ���
	ReleaseTime				DATETIME,				--����ʱ��
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbSysNotice_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysNotice') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysNotice SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysNotice! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbSysLog
-- ��    ��	: ��־��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysLog') IS NOT NULL
BEGIN
	DROP TABLE TbSysLog
	PRINT '<<< DROPPER TABLE TbSysLog! >>>'
END
GO
CREATE TABLE TbSysLog
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	UserId					VARCHAR(32),			--�����û�ID
	UserAccount				VARCHAR(50),			--�����û��˺�
	UserName				NVARCHAR(100),			--�����û�����
	UserDepart				NVARCHAR(50),			--�����û����ڲ���
	OperateIp				VARCHAR(50),			--����IP
	OperateModule			NVARCHAR(50),			--����ģ��
	OperateInfo				NVARCHAR(2000),			--��������
	OperateTime				DATETIME,				--����ʱ��
	OperateResult			NVARCHAR(200),			--�������
	ExceptionInfo			NVARCHAR(4000),			--�����쳣��Ϣ
	CONSTRAINT PK_TbSysLog_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbSysLog') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbSysLog SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbSysLog! >>>'
END
GO




/***********************************************************************************************
��Ϣ����
	��Ƶ����
	��Ƶ����
	��Ŀ����
	���¹���
	����ͶƱ
	��������
	��ϵ����
***********************************************************************************************/

-- **********************************************************************************************
-- ��    ��	: TbInfoAudio
-- ��    ��	: ��Ƶ����
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoAudio') IS NOT NULL
BEGIN
	DROP TABLE TbInfoAudio;
	PRINT '<<< DROPPER TABLE TbInfoAudio! >>>'
END
GO
CREATE TABLE TbInfoAudio
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	AudioType				VARCHAR(50),			--��Ƶ����(�ֵ�)
	AudioTitle				NVARCHAR(100),			--��ʾ����
	CoverImage				VARCHAR(2000),			--����ͼ
	AudioPath				VARCHAR(2000),			--��Ƶ·��
	Summary					NVARCHAR(500),			--ժҪ
	Content					NVARCHAR(MAX),			--����
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoAudio_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoAudio') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoAudio SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoAudio! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoVideo
-- ��    ��	: ��Ƶ����
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVideo') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVideo;
	PRINT '<<< DROPPER TABLE TbInfoVideo! >>>'
END
GO
CREATE TABLE TbInfoVideo
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	VideoType				VARCHAR(50),			--��Ƶ����(�ֵ�)
	VideoTitle				NVARCHAR(100),			--��ʾ����
	CoverImage				VARCHAR(2000),			--����ͼ
	Origin					INT,					--��Դ[1:�ϴ���2:��Ѷ��Ƶ]
	VideoPath				VARCHAR(2000),			--��Ƶ·��
	TencentVideoCode		VARCHAR(2000),			--��Ѷ��Ƶͨ�ô���
	Summary					NVARCHAR(500),			--ժҪ
	Content					NVARCHAR(MAX),			--����
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoVideo_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoVideo') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoVideo SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoVideo! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoColumn
-- ��    ��	: ��Ŀ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoColumn') IS NOT NULL
BEGIN
	DROP TABLE TbInfoColumn
	PRINT '<<< DROPPER TABLE TbInfoColumn! >>>'
END
GO
CREATE TABLE TbInfoColumn
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Pid						VARCHAR(32) NOT NULL,	--���ڵ�Id
	ColumnName				VARCHAR(50) NOT NULL,	--��Ŀ����
	ColumnCode				VARCHAR(50),			--��Ŀ����[��Դ���ֵ䣺��Ʒproduct, ����news, ��Ƹrecruit, ��������abouts, ��ϵ����contact, ����case, ֤��cert]
	ColumnDesc				NVARCHAR(1000),			--��Ŀ����
	ColumnState				INT,					--��Ŀ״̬[0:���á�1:����]
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoColumn_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoColumn') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoColumn SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoColumn! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoColumnBanner
-- ��    ��	: ��Ŀ���ͼƬ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoColumnBanner') IS NOT NULL
BEGIN
	DROP TABLE TbInfoColumnBanner
	PRINT '<<< DROPPER TABLE TbInfoColumnBanner! >>>'
END
GO
CREATE TABLE TbInfoColumnBanner
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	ColumnId				VARCHAR(32) NOT NULL,	--��ĿId
	ImageName				VARCHAR(100),			--ͼƬ�ļ�����
	ImagePath				VARCHAR(2000),			--ͼƬ�ļ���ַ
	ImageSize				VARCHAR(100),			--ͼƬ�ļ��ߴ�
	LinkUrl					VARCHAR(1000),			--ͼƬ����url
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoColumnBanner_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoColumnBanner') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoColumnBanner SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoColumnBanner! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoArticle
-- ��    ��	: ������Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoArticle') IS NOT NULL
BEGIN
	DROP TABLE TbInfoArticle
	PRINT '<<< DROPPER TABLE TbInfoArticle! >>>'
END
GO
CREATE TABLE TbInfoArticle
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	ColumnId				VARCHAR(32) NOT NULL,	--��ĿId
	Title					NVARCHAR(200) NOT NULL,	--����
	Summary					NVARCHAR(500),			--ժҪ
	Content					NVARCHAR(MAX),			--����
	CoverImage				VARCHAR(2000),			--����ͼ
	IsRelease				INT,					--�Ƿ񷢲�[0:��1:��]
	Releaser				VARCHAR(32),			--�����û�Id
	ReleaseUser				NVARCHAR(50),			--������(����)
	ReleaseUnit				NVARCHAR(100),			--������λ(����)
	ReleaseTime				DATETIME,				--����ʱ��
	Origin					NVARCHAR(100),			--��Դ
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoArticle_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoArticle') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoArticle SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoArticle! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoArticleImage
-- ��    ��	: ����ͼƬ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoArticleImage') IS NOT NULL
BEGIN
	DROP TABLE TbInfoArticleImage
	PRINT '<<< DROPPER TABLE TbInfoArticleImage! >>>'
END
GO
CREATE TABLE TbInfoArticleImage
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	ArticleId				VARCHAR(32) NOT NULL,	--����Id
	ImageName				NVARCHAR(100),			--ͼƬ�ļ�����
	ImagePath				VARCHAR(2000),			--ͼƬ�ļ���ַ
	ImageSize				VARCHAR(100),			--ͼƬ�ļ��ߴ�
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoArticleImage_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoArticleImage') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoArticleImage SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoArticleImage! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoArticleMedia
-- ��    ��	: ���¶�ý����Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoArticleMedia') IS NOT NULL
BEGIN
	DROP TABLE TbInfoArticleMedia
	PRINT '<<< DROPPER TABLE TbInfoArticleMedia! >>>'
END
GO
CREATE TABLE TbInfoArticleMedia
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	ArticleId				VARCHAR(32) NOT NULL,	--����Id
	MediaId					VARCHAR(32) NOT NULL,	--��ý��Id
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoArticleMedia_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoArticleMedia') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoArticleMedia SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoArticleMedia! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoVote
-- ��    ��	: ͶƱ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVote') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVote
	PRINT '<<< DROPPER TABLE TbInfoVote! >>>'
END
GO
CREATE TABLE TbInfoVote
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	VoteSubject				NVARCHAR(100) NOT NULL,	--ͶƱ����
	StartTime				DATETIME,				--ͶƱ��ʼʱ��
	EndTime					DATETIME,				--ͶƱ����ʱ��
	VoteState				INT,					--ͶƱ״̬[0:���á�1:����]
	VoteMode				INT,					--ͶƱ��ʽ[0:��ѡ��1:��ѡ]
	MultiOptionQuantity		INT,					--ͶƱ��ѡ��ѡ��Ŀ
	SortMode				VARCHAR(50),			--ͶƱѡ����ʾ����ʽ[�ֵ�]
	SetVoteQuantityShow		INT,					--�Ƿ���ʾʵʱƱ��[0:���ء�1:��ʾ]
	SetPreventBrush			INT,					--������֤��ˢ[0:�رա�1:����]
	SetResultShowMode		INT,					--����ɼ���ʽ[0:�����ˡ�1:����Ա]
	SetVoteChance			INT,					--����ͶƱ����[0:��1�Ρ�1:ÿ��1��]
	VoteTotalQuantity		INT,					--ͶƱ��Ʊ��
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoVote_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoVote') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoVote SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoVote! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoVoteOption
-- ��    ��	: ͶƱѡ����Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVoteOption') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVoteOption
	PRINT '<<< DROPPER TABLE TbInfoVoteOption! >>>'
END
GO
CREATE TABLE TbInfoVoteOption
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	VoteId					VARCHAR(32) NOT NULL,	--ͶƱId
	OptionNum				INT,					--ѡ����
	OptionImage				VARCHAR(2000),			--ѡ��ͼƬ
	OptionText				NVARCHAR(100),			--ѡ������
	OptionContent			NVARCHAR(MAX),			--ѡ������
	VoteQuantity			INT,					--��ǰƱ��
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoVoteOption_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoVoteOption') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoVoteOption SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoVoteOption! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoVoteRecord
-- ��    ��	: ͶƱ��¼��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVoteRecord') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVoteRecord
	PRINT '<<< DROPPER TABLE TbInfoVoteRecord! >>>'
END
GO
CREATE TABLE TbInfoVoteRecord
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	VoteId					VARCHAR(32) NOT NULL,	--ͶƱId
	OptionId				VARCHAR(32) NOT NULL,	--ͶƱѡ��Id
	MemberId				VARCHAR(32) NOT NULL,	--��ԱId
	VoteTime				DATETIME,				--ͶƱʱ��
	VoteOrigin				INT,					--ͶƱ��Դ[0:��վ��1:�ֻ���2:΢��С����]
	VoteIp					VARCHAR(50),			--ͶƱIp
	CONSTRAINT PK_TbInfoVoteRecord_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoVoteRecord') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoVoteRecord SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoVoteRecord! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoMessage
-- ��    ��	: ����������Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoMessage') IS NOT NULL
BEGIN
	DROP TABLE TbInfoMessage
	PRINT '<<< DROPPER TABLE TbInfoMessage! >>>'
END
GO
CREATE TABLE TbInfoMessage
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Contacter				NVARCHAR(100),			--��ϵ������
	Mobile					VARCHAR(50),			--�ֻ�
	LinkTel					VARCHAR(50),			--��ϵ�绰
	LinkAddress				NVARCHAR(500),			--��ϵ��ַ
	Email					VARCHAR(200),			--����
	MessageContent			NVARCHAR(1000),			--��������
	MessageTime				DATETIME,				--����ʱ��
	MessageIp				VARCHAR(50),			--����Ip
	Replyer					VARCHAR(32),			--�ظ���Id
	ReplyContent			NVARCHAR(1000),			--�ظ�����
	ReplyTime				DATETIME,				--�ظ�ʱ��
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoMessage_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoMessage') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoMessage SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoMessage! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoContact
-- ��    ��	: ��ϵ������Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoContact') IS NOT NULL
BEGIN
	DROP TABLE TbInfoContact
	PRINT '<<< DROPPER TABLE TbInfoContact! >>>'
END
GO
CREATE TABLE TbInfoContact
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Title					NVARCHAR(100),			--����
	LinkAddress				NVARCHAR(500),			--��ϵ��ַ
	LinkTel					VARCHAR(200),			--��ϵ�绰(���)
	Fax						VARCHAR(50),			--����
	PostalCode				VARCHAR(10),			--�ʱ�
	Email					VARCHAR(200),			--����
	ProvinceId				VARCHAR(32),			--ʡ��Id
	ProvinceName			NVARCHAR(50),			--ʡ������
	CityIdArray				VARCHAR(2000),			--���ڳ���Id����
	CityNameArray			VARCHAR(2000),			--���ڳ������Ƽ���
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoContact_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoContact') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoContact SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoContact! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbInfoConfig
-- ��    ��	: ������Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoConfig') IS NOT NULL
BEGIN
	DROP TABLE TbInfoConfig
	PRINT '<<< DROPPER TABLE TbInfoConfig! >>>'
END
GO
CREATE TABLE TbInfoConfig
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	ConfigCode				VARCHAR(50),			--��������
	ConfigValue				NVARCHAR(2000),			--������ֵ
	ConfigDesc				NVARCHAR(1000),			--����������
	ConfigCate				VARCHAR(50),			--��������[�ֵ䣺��Ʒ���á���Ϣ֪ͨ����Ա�ɳ�]
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoConfig_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoConfig') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoConfig SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoConfig! >>>'
END
GO
/*
��Ʒ������Ϣ
	��΢��֧��������΢��֧���̻��š�΢��֧����Կ������֧������������֧������������֧��������
	�Ƿ���ʾ���������������İ����Ƿ���ʾʣ������ʣ�����İ����۸�λ�İ�������ť�İ���
	���Ȩ�����á�ѡ����Ⱥ���á�ָ���ȼ����á�ָ����ǩ���ã�
	���ʼ�֪ͨ����������֪ͨ�����䡢����֪ͨ���ݡ�����֪ͨ����������Ա�ֻ����ֻ�֪ͨ���ݡ���Ա����֪ͨ������
*/


-- **********************************************************************************************
-- ��    ��	: TbInfoLabel
-- ��    ��	: ��ǩ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoLabel') IS NOT NULL
BEGIN
	DROP TABLE TbInfoLabel
	PRINT '<<< DROPPER TABLE TbInfoLabel! >>>'
END
GO
CREATE TABLE TbInfoLabel
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	LabelName				NVARCHAR(50),			--��ǩ����
	LabelDesc				NVARCHAR(1000),			--��ǩ����
	LabelCate				VARCHAR(50),			--��������[�ֵ䣺��Ʒ����Ա]
	LabelMemberCount		INT,					--��ǩ��Ա��
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbInfoLabel_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbInfoLabel') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbInfoLabel SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbInfoLabel! >>>'
END
GO




/***********************************************************************************************
��Ʒ����
	��Ʒ����
	��Ʒ��ǩ
	��Ʒ��Ϣ
	��Ʒ����
	��������
	��Ϣ֪ͨ
***********************************************************************************************/
-- **********************************************************************************************
-- ��    ��	: TbGoodsClassify
-- ��    ��	: ��Ʒ�����
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoodsClassify') IS NOT NULL
BEGIN
	DROP TABLE TbGoodsClassify
	PRINT '<<< DROPPER TABLE TbGoodsClassify! >>>'
END
GO
CREATE TABLE TbGoodsClassify
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Pid						VARCHAR(32) NOT NULL,	--���ڵ�Id
	ClassifyName			NVARCHAR(50),			--��������
	ClassifyDesc			NVARCHAR(1000),			--��������
	CoverImage				VARCHAR(2000),			--����ͼ
	ClassifyState			INT,					--״̬[0:���á�1:����]
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbGoodsClassify_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbGoodsClassify') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbGoodsClassify SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbGoodsClassify! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbGoods
-- ��    ��	: ��Ʒ��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoods') IS NOT NULL
BEGIN
	DROP TABLE TbGoods
	PRINT '<<< DROPPER TABLE TbGoods! >>>'
END
GO
CREATE TABLE TbGoods
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	GoodsName				NVARCHAR(50) NOT NULL,	--��Ʒ����
	ClassifyId				NVARCHAR(32),			--����Id
	ClassifyName			NVARCHAR(50),			--��������
	GoodsCode				VARCHAR(50),			--��Ʒ���
	CoverImage				VARCHAR(2000),			--����ͼ
	Summary					NVARCHAR(500),			--ժҪ
	PriceType				INT,					--�۸�����[0:Ĭ�ϡ�1:��ѡ�2:����]
	SalePrice				DECIMAL(8, 2),			--���ۼ�
	PromotionPrice			DECIMAL(8, 2),			--������
	PriceUnitType			INT,					--�۸�λ����[0:Ĭ�ϡ�1:�Զ���]
	PriceUnitText			NVARCHAR(50),			--�۸�λ����,
	GoodsLabel				NVARCHAR(1000),			--��Ʒ��ǩ
	GoodsBrand				NVARCHAR(50),			--��ƷƷ��
	GoodsDetail				NVARCHAR(MAX),			--��Ʒ����
	SetLimitGoodsQuantity	INT,					--�Ƿ�������Ʒ����[0:��1:��]
	GoodsQuantity			INT,					--��Ʒ����
	SetPurchase				INT,					--�Ƿ��޹�[0:�رա�1:����]
	PurchaseType			INT,					--�޹�����[0:�ܼơ�1:ÿ�¡�2:ÿ�ܡ�3:ÿ��]
	PurchaseQuantity		INT,					--�޹�����
	ReachLimitPrompt		NVARCHAR(100),			--�ﵽ������ʾ
	BrowsePermission		INT,					--���Ȩ��[0:Ĭ�ϡ�1:�Զ���]
	SelectCrowd				INT,					--ѡ����Ⱥ[0:ָ���ȼ���1:ָ����ǩ]
	MemberLevelId			VARCHAR(32),			--ָ����Ա�ȼ�id
	MemberLabelInfo			VARCHAR(2000),			--ָ����Ա��ǩ����
	StockPriceSet			INT,					--���۸�����[0:Ĭ�ϡ�1:�Զ���]
	StockQuantitySet		INT,					--�����������[0:Ĭ�ϡ�1:�Զ���]
	StockPurchaseSet		INT,					--����޹�����[0:Ĭ�ϡ�1:�Զ���]
	StockIsAllPurchase		INT,					--������Ƿ�ȫ���޹�[0:��1:��]
	StockTotalQuantity		INT,					--���������
	RemainQuantity			INT,					--ʣ������
	OrderQuantity			INT,					--ʵ�ʶ�����
	DealQuantity			INT,					--ʵ�ʹ�����
	OnShelf					INT,					--�Ƿ��ϼ�[0:��1:��]
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbGoods_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbGoods') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbGoods SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbGoods! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbGoodsFile
-- ��    ��	: ��Ʒ�ļ���Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoodsFile') IS NOT NULL
BEGIN
	DROP TABLE TbGoodsFile
	PRINT '<<< DROPPER TABLE TbGoodsFile! >>>'
END
GO
CREATE TABLE TbGoodsFile
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	GoodsId					VARCHAR(32) NOT NULL,	--��ƷId
	FileType				INT,					--�ļ�����[0:ͼƬ��1:��Ƶ��2:�ĵ�]
	[FileName]				NVARCHAR(100),			--�ļ�����
	FilePath				VARCHAR(2000),			--�ļ�·��
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbGoodsFile_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbGoodsFile') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbGoodsFile SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbGoodsFile! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbGoodsStock
-- ��    ��	: ��Ʒ�����Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoodsStock') IS NOT NULL
BEGIN
	DROP TABLE TbGoodsStock
	PRINT '<<< DROPPER TABLE TbGoodsStock! >>>'
END
GO
CREATE TABLE TbGoodsStock
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	GoodsId					VARCHAR(32) NOT NULL,	--��ƷId
	StockName				NVARCHAR(100),			--��Ʒ���������
	PriceType				INT,					--�۸�����[0:Ĭ�ϡ�1:��ѡ�2:����]
	SalePrice				DECIMAL(8, 2),			--���ۼ�
	PromotionPrice			DECIMAL(8, 2),			--������
	SetLimitStockQuantity	INT,					--�Ƿ���������[0:��1:��]
	StockQuantity			INT,					--����
	SetPurchase				INT,					--�Ƿ��޹�[0:�رա�1:����]
	PurchaseType			INT,					--�޹�����[0:�ܼơ�1:ÿ�¡�2:ÿ�ܡ�3:ÿ��]
	PurchaseQuantity		INT,					--�޹�����
	ReachLimitPrompt		NVARCHAR(100),			--�ﵽ������ʾ
	RemainQuantity			INT,					--ʣ������
	OrderQuantity			INT,					--ʵ�ʶ�����
	DealQuantity			INT,					--ʵ�ʹ�����
	OnShelf					INT,					--�Ƿ��ϼ�[0:��1:��]
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbGoodsStock_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbGoodsStock') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbGoodsStock SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbGoodsStock! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbOrder
-- ��    ��	: ������Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbOrder') IS NOT NULL
BEGIN
	DROP TABLE TbOrder
	PRINT '<<< DROPPER TABLE TbOrder! >>>'
END
GO
CREATE TABLE TbOrder
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	OrderNum				VARCHAR(50) NOT NULL,	--�������
	OrderTime				DATETIME,				--����ʱ��
	OrderState				INT,					--����״̬[0:��֧����1:��֧����2:�ѷ�����3:���ջ���4:��ȡ����5:���˿6:�����]
	OrderOrigin				INT,					--������Դ[1:��վ������2:΢��С���򶩵���3:�ֻ�����]
	GoodsId					VARCHAR(32) NOT NULL,	--��ƷId
	GoodsName				NVARCHAR(50),			--��Ʒ����
	CoverImage				VARCHAR(2000),			--����ͼ
	GoodsStockId			VARCHAR(32),			--��Ʒ���Id
	GoodsStockName			NVARCHAR(100),			--��Ʒ���������
	GoodsClassifyId			NVARCHAR(32),			--��Ʒ����Id
	GoodsClassifyName		NVARCHAR(50),			--��Ʒ��������
	UnitPrice				DECIMAL(10, 2),			--����
	OrderQuantity			INT,					--��������
	OrderAmount				DECIMAL(10, 2),			--�������
	DiscountAmount			DECIMAL(10, 2),			--�Żݽ��
	PayMethod				INT,					--֧����ʽ
	PayAmount				DECIMAL(10, 2),			--֧�����
	PayTime					DATETIME,				--֧��ʱ��
	DeliveryTime			DATETIME,				--����ʱ��
	ReceiveTime				DATETIME,				--�ջ�ʱ��
	CancelTime				DATETIME,				--ȡ��ʱ��
	CancelReason			NVARCHAR(500),			--ȡ��ԭ��
	ApplyRefundTime			DATETIME,				--�����˿�ʱ��
	ApplyRefundReason		NVARCHAR(500),			--�����˿�ԭ��
	RefundTime				DATETIME,				--�˿�ʱ��
	FinishTime				DATETIME,				--���ʱ��
	CourierCompany			NVARCHAR(200),			--��ݹ�˾
	CourierNum				VARCHAR(50),			--��ݵ���
	CourierSnapshot			VARCHAR(2000),			--��ݿ���ͼƬ
	MemberId				VARCHAR(32),			--��ԱId
	MemberName				NVARCHAR(100),			--��Ա����
	MemberAvatar			VARCHAR(2000),			--��Աͷ��
	BuyerName				NVARCHAR(100),			--�������
	BuyerMobile				VARCHAR(50),			--����ֻ�
	BuyerAddress			NVARCHAR(500),			--��ҵ�ַ
	BuyerMessage			NVARCHAR(1000),			--�������
	Remark					NVARCHAR(2000),			--��ע
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbOrder_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbOrder') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbOrder SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbOrder! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbOrderRecord
-- ��    ��	: ����������¼��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbOrderRecord') IS NOT NULL
BEGIN
	DROP TABLE TbOrderRecord
	PRINT '<<< DROPPER TABLE TbOrderRecord! >>>'
END
GO
CREATE TABLE TbOrderRecord
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	OrderId					VARCHAR(32) NOT NULL,	--����Id
	OrderNum				VARCHAR(50),			--�������
	OrderState				INT,					--����״̬[0:��֧����1:��֧����2:�ѷ�����3:���ջ���4:��ȡ����5:���˿6:�����]
	RecordTime				DATETIME,				--��¼ʱ��
	RecordDesc				NVARCHAR(1000),			--��¼����
	CONSTRAINT PK_TbOrderRecord_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbOrderRecord') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbOrderRecord SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbOrderRecord! >>>'
END
GO


/***********************************************************************************************
�ͻ�����
	�ÿ͹���
	��Ա�ȼ�
	��Ա�ɳ�
	��ԱȨ��
	��Ա��ǩ
	��Ա����
***********************************************************************************************/
-- **********************************************************************************************
-- ��    ��	: TbVisitor
-- ��    ��	: �ÿ���Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbVisitor') IS NOT NULL
BEGIN
	DROP TABLE TbVisitor
	PRINT '<<< DROPPER TABLE TbVisitor! >>>'
END
GO
CREATE TABLE TbVisitor
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	VisitIp					VARCHAR(50),			--����Ip
	MemberId				VARCHAR(32),			--��ԱId
	WxOpenId				VARCHAR(100),			--΢��openid
	Avatar					VARCHAR(2000),			--ͷ��
	NickName				NVARCHAR(100),			--�ǳ�
	Mobile					VARCHAR(50),			--�ֻ�
	Intention				INT,					--�����[0:������1:������2:������]
	LastActiveTime			DATETIME,				--�����Ծʱ��
	FirstVisitTime			DATETIME,				--�׷�ʱ��
	Terminal				INT,					--�ն�[0:��վ��1:�ֻ���2:΢��С����]
	Origin					INT,					--��Դ[0:������1:����]
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbVisitor_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbVisitor') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbVisitor SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbVisitor! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbVisitRecord
-- ��    ��	: �ÿͼ�¼��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbVisitRecord') IS NOT NULL
BEGIN
	DROP TABLE TbVisitRecord
	PRINT '<<< DROPPER TABLE TbVisitRecord! >>>'
END
GO
CREATE TABLE TbVisitRecord
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	VisitorId				VARCHAR(32),			--�ÿ�Id
	Avatar					VARCHAR(2000),			--ͷ��
	NickName				NVARCHAR(100),			--�ǳ�
	Intention				INT,					--�����[0:������1:������2:������]
	RecordTime				DATETIME,				--��¼ʱ��
	RecordDesc				NVARCHAR(1000),			--��¼����
	CONSTRAINT PK_TbVisitRecord_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbVisitRecord') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbVisitRecord SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbVisitRecord! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbMemberLevel
-- ��    ��	: ��Ա�ȼ���
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberLevel') IS NOT NULL
BEGIN
	DROP TABLE TbMemberLevel
	PRINT '<<< DROPPER TABLE TbMemberLevel! >>>'
END
GO
CREATE TABLE TbMemberLevel
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	LevelCode				VARCHAR(50),			--�ȼ����
	LevelName				NVARCHAR(50),			--�ȼ�����
	Integral				INT,					--�ȼ�����
	RightCount				INT,					--Ȩ����Ŀ
	MemberCount				INT,					--��Ա��Ŀ
	Icon					VARCHAR(2000),			--ͼ��
	RightDesc				NVARCHAR(1000),			--Ȩ��˵��
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbMemberLevel_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbMemberLevel') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbMemberLevel SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbMemberLevel! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbMemberRight
-- ��    ��	: ��ԱȨ���
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberRight') IS NOT NULL
BEGIN
	DROP TABLE TbMemberRight
	PRINT '<<< DROPPER TABLE TbMemberRight! >>>'
END
GO
CREATE TABLE TbMemberRight
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	RightName				NVARCHAR(50),			--Ȩ������
	RightDesc				NVARCHAR(1000),			--Ȩ������
	RightIcon				VARCHAR(2000),			--Ȩ��ͼ��
	SetShow					INT,					--�Ƿ���ʾ[0:��1:��]
	SortIndex				INT,					--�����
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbMemberRight_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbMemberRight') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbMemberRight SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbMemberRight! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbMemberLevelRight
-- ��    ��	: ��Ա�ȼ�Ȩ���
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberLevelRight') IS NOT NULL
BEGIN
	DROP TABLE TbMemberLevelRight
	PRINT '<<< DROPPER TABLE TbMemberLevelRight! >>>'
END
GO
CREATE TABLE TbMemberLevelRight
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	LevelId					VARCHAR(32),			--�ȼ�Id
	RightId					VARCHAR(32),			--Ȩ��Id
	RightName				NVARCHAR(50),			--Ȩ������
	Discount				DECIMAL(5, 2),			--�ۿ�ֵ
	CONSTRAINT PK_TbMemberLevelRight_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbMemberLevelRight') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbMemberLevelRight SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbMemberLevelRight! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbMember
-- ��    ��	: ��Ա��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbMember') IS NOT NULL
BEGIN
	DROP TABLE TbMember
	PRINT '<<< DROPPER TABLE TbMember! >>>'
END
GO
CREATE TABLE TbMember
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	Account					VARCHAR(50) NOT NULL,	--�˺�
	[Password]				VARCHAR(300),			--��¼����
	NickName				NVARCHAR(100),			--�ǳ�
	RealName				NVARCHAR(100),			--����
	Gender					CHAR(1),				--�Ա�[M�С�FŮ��Uδ֪]
	Avatar					VARCHAR(2000),			--ͷ��
	Mobile					VARCHAR(50),			--�ֻ���
	LinkTel					VARCHAR(50),			--��ϵ�绰
	LinkAddress				NVARCHAR(500),			--��ϵ��ַ
	Birthday				DATETIME,				--��������
	IdCardNo				VARCHAR(50),			--���֤��
	Email					VARCHAR(200),			--����
	Wechat					VARCHAR(50),			--΢�ź�
	UserState				INT,					--�û�״̬[0ͣ�á�1���2����]
	WxOpenId				VARCHAR(100),			--΢��openid
	WxSessionKey			VARCHAR(200),			--΢��sessionkey
	City					NVARCHAR(50),			--���ڳ���
	Province				NVARCHAR(50),			--����ʡ��
	Country					NVARCHAR(50),			--���ڹ���
	LevelId					VARCHAR(32),			--�ȼ�Id
	LevelCode				VARCHAR(50),			--�ȼ����
	LevelName				NVARCHAR(50),			--�ȼ�����
	LabelIdArray			VARCHAR(2000),			--��ǩId����
	LabelArray				VARCHAR(2000),			--��ǩ����
	Integral				INT,					--����
	Balance					DECIMAL(10, 2),			--�˻����
	OrderCount				INT,					--��������
	DealAmount				DECIMAL(10, 2),			--�ɽ����
	PayPassword				VARCHAR(300),			--֧������
	RegisterTime			DATETIME,				--ע��ʱ��
	MemberShipTime			DATETIME,				--��Ϊ��Աʱ��
	Origin					INT,					--��Դ[0:ע�ᡢ1:΢��С����]
	Remark					NVARCHAR(2000),			--��ע
	IsDeleted				INT,					--�Ƿ�ɾ��[0:��1:��]
	Creater					VARCHAR(32),			--������Id
	CreateTime				DATETIME,				--����ʱ��
	Updater					VARCHAR(32),			--�޸���Id
	UpdateTime				DATETIME,				--�޸�ʱ��
	Deleter					VARCHAR(32),			--ɾ����Id
	DeleteTime				DATETIME,				--ɾ��ʱ��
	CONSTRAINT PK_TbMember_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbMember') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbMember SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbMember! >>>'
END
GO


-- **********************************************************************************************
-- ��    ��	: TbMemberIntegral
-- ��    ��	: ��Ա���ּ�¼��Ϣ��
-- ��������	: 2021-05-06
-- ������	:
-- �޸ļ�¼	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberIntegral') IS NOT NULL
BEGIN
	DROP TABLE TbMemberIntegral
	PRINT '<<< DROPPER TABLE TbMemberIntegral! >>>'
END
GO
CREATE TABLE TbMemberIntegral
(
	Id						VARCHAR(32) NOT NULL,	--����Id
	MemberId				VARCHAR(32) NOT NULL,	--��ԱId
	Integral				INT,					--������
	IntegralTime			DATETIME,				--����ʱ��
	IntegralRule			NVARCHAR(100),			--���ֹ���
	IntegralDesc			NVARCHAR(500),			--��������
	CONSTRAINT PK_TbMemberIntegral_ID PRIMARY KEY (Id)
)
GO
IF OBJECT_ID('TbMemberIntegral') IS NOT NULL
BEGIN
	PRINT '<<< CREATED TABLE TbMemberIntegral SUCCESSFUL! >>>'
END
ELSE
BEGIN
	PRINT '<<< FAILED CREATING TABLE TbMemberIntegral! >>>'
END
GO



