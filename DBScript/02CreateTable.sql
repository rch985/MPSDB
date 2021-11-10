-- **********************************************************************************************
-- File Name	: 02CreateTable.sql
-- Function		: 创建数据表
-- CreateDate	: 2021-05-06
-- Creator		: 
-- Modify		:
-- **********************************************************************************************
USE [MPS]
GO





/***********************************************************************************************
系统设置
	用户管理
	角色管理
	菜单管理
	部门管理
	字典管理
	区划管理
	公告管理
	日志管理

信息管理
	音频管理
	视频管理
	栏目管理（增删改查、横幅设置）
		栏目code=>(产品product, 新闻news, 招聘recruit, 关于我们abouts, 联系我们contact, 案例case, 证书cert) -- 走字典
	文章管理
	互动投票
	在线留言

商品管理
	商品分类
	商品信息
	商品设置
	订单管理
	消息通知

客户管理
	访客管理
	商机管理
	会员等级
	会员成长
	会员权益
	会员标签
	会员管理
***********************************************************************************************/





/***********************************************************************************************
系统设置
	用户管理
	角色管理
	菜单管理
	部门管理
	字典管理
	区划管理
	公告管理
	日志管理
***********************************************************************************************/

-- **********************************************************************************************
-- 表    名	: TbSysUser
-- 描    述	: 用户信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysUser') IS NOT NULL
BEGIN
	DROP TABLE TbSysUser
	PRINT '<<< DROPPER TABLE TbSysUser! >>>'
END
GO
CREATE TABLE TbSysUser
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Account					VARCHAR(50) NOT NULL,	--账号
	[Password]				VARCHAR(300),			--登录密码
	RealName				NVARCHAR(100),			--真实姓名
	Gender					CHAR(1),				--性别[M男、F女、U未知]
	Avatar					VARCHAR(2000),			--头像
	Mobile					VARCHAR(50),			--手机号
	LinkTel					VARCHAR(50),			--联系电话
	LinkAddress				NVARCHAR(500),			--联系地址
	Birthday				DATETIME,				--出生年月
	IdCardNo				VARCHAR(50),			--身份证号
	Email					VARCHAR(200),			--邮箱
	Wechat					VARCHAR(50),			--微信号
	QQ						VARCHAR(50),			--QQ号
	UserState				INT,					--用户状态[0停用、1激活、2禁用]
	RegisterTime			DATETIME,				--注册时间,
	WorkNo					VARCHAR(50),			--工号
	DepartId				VARCHAR(32),			--所在部门Id
	DepartName				NVARCHAR(50),			--所在部门名称
	JobId					VARCHAR(50),			--所在职位字典值
	JobName					VARCHAR(100),			--所在职位字典标签
	HireTime				DATETIME,				--入职时间
	SignPic					VARCHAR(2000),			--个人签名图片
	LastLoginTime			DATETIME,				--上次登录时间
	IsAdmin					INT,					--是否管理员[0否、1是]
	Remark					NVARCHAR(2000),			--备注
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysUserState
-- 描    述	: 用户状态变更表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysUserState') IS NOT NULL
BEGIN
	DROP TABLE TbSysUserState
	PRINT '<<< DROPPER TABLE TbSysUserState! >>>'
END
GO
CREATE TABLE TbSysUserState
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	UserId					VARCHAR(32) NOT NULL,	--变更用户Id
	UserState				INT,					--变更后的用户状态
	ChangeReason			NVARCHAR(200),			--变更原因
	ChangeTime				DATETIME,				--变更时间
	OperaterId				VARCHAR(32),			--操作用户Id
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysUserRole
-- 描    述	: 用户角色表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysUserRole') IS NOT NULL
BEGIN
	DROP TABLE TbSysUserRole
	PRINT '<<< DROPPER TABLE TbSysUserRole! >>>'
END
GO
CREATE TABLE TbSysUserRole
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	UserId					VARCHAR(32),			--用户Id
	RoleId					VARCHAR(32),			--角色Id
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
-- 表    名	: TbSysRole
-- 描    述	: 角色信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysRole') IS NOT NULL
BEGIN
	DROP TABLE TbSysRole
	PRINT '<<< DROPPER TABLE TbSysRole! >>>'
END
GO
CREATE TABLE TbSysRole
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	RoleName				NVARCHAR(50) NOT NULL,	--角色名称
	RoleDesc				NVARCHAR(1000),			--描述
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysMenu
-- 描    述	: 菜单信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysMenu') IS NOT NULL
BEGIN
	DROP TABLE TbSysMenu
	PRINT '<<< DROPPER TABLE TbSysMenu! >>>'
END
GO
CREATE TABLE TbSysMenu
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Pid						VARCHAR(32) NOT NULL,	--父节点Id
	MenuName				NVARCHAR(50) NOT NULL,	--菜单名称
	MenuCode				VARCHAR(20),			--菜单编号
	MenuLevel				INT,					--层级
	MenuIcon				VARCHAR(100),			--显示图标
	MenuRoute				VARCHAR(1000),			--路由地址
	MenuState				INT,					--菜单状态[0:禁用、1:启用]
	Remark					NVARCHAR(2000),			--备注
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysRoleMenu
-- 描    述	: 角色菜单表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysRoleMenu') IS NOT NULL
BEGIN
	DROP TABLE TbSysRoleMenu
	PRINT '<<< DROPPER TABLE TbSysRoleMenu! >>>'
END
GO
CREATE TABLE TbSysRoleMenu
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	RoleId					VARCHAR(32),			--角色Id
	MenuId					VARCHAR(32),			--菜单Id
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
-- 表    名	: TbSysDepart
-- 描    述	: 部门信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysDepart') IS NOT NULL
BEGIN
	DROP TABLE TbSysDepart
	PRINT '<<< DROPPER TABLE TbSysDepart! >>>'
END
GO
CREATE TABLE TbSysDepart
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Pid						VARCHAR(32) NOT NULL,	--父节点Id
	DepartName				NVARCHAR(50),			--部门名称
	DepartCode				VARCHAR(20),			--部门编号
	Director				NVARCHAR(50),			--部门负责人
	Mobile					VARCHAR(50),			--负责人手机号
	DepartState				INT,					--部门状态[0:停用、1:启用]
	StaffCount				INT,					--部门人数
	Remark					NVARCHAR(2000),			--备注
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysDict
-- 描    述	: 字典信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysDict') IS NOT NULL
BEGIN
	DROP TABLE TbSysDict
	PRINT '<<< DROPPER TABLE TbSysDict! >>>'
END
GO
CREATE TABLE TbSysDict
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	DictName				NVARCHAR(50) NOT NULL,	--字典名称
	DictDesc				NVARCHAR(1000),			--描述
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysDictDetail
-- 描    述	: 字典详情表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysDictDetail') IS NOT NULL
BEGIN
	DROP TABLE TbSysDictDetail
	PRINT '<<< DROPPER TABLE TbSysDictDetail! >>>'
END
GO
CREATE TABLE TbSysDictDetail
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	DictId					VARCHAR(32) NOT NULL,	--字典Id
	DictLabel				VARCHAR(100),			--字典标签
	DictValue				VARCHAR(50),			--字典值
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysArea
-- 描    述	: 行政区划表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysArea') IS NOT NULL
BEGIN
	DROP TABLE TbSysArea
	PRINT '<<< DROPPER TABLE TbSysArea! >>>'
END
GO
CREATE TABLE TbSysArea
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Pid						VARCHAR(32) NOT NULL,	--父节点Id
	AreaName				NVARCHAR(50),			--区划名称
	ShortName				NVARCHAR(50),			--简称
	AreaType				INT,					--区划类型[1国、2省、3市、4区/县]
	AreaCode				VARCHAR(50),			--区划编码
	AreaZone				VARCHAR(20),			--区号
	PostalCode				VARCHAR(10),			--邮政编码
	AreaDesc				NVARCHAR(1000),			--描述
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysNotice
-- 描    述	: 系统公告表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysNotice') IS NOT NULL
BEGIN
	DROP TABLE TbSysNotice
	PRINT '<<< DROPPER TABLE TbSysNotice! >>>'
END
GO
CREATE TABLE TbSysNotice
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	NoticeTitle				NVARCHAR(200) NOT NULL,	--公告标题
	NoticeContent			NVARCHAR(MAX),			--公告正文
	IsReleased				INT,					--是否发布[0:否、1:是]
	Releaser				VARCHAR(32),			--发布人ID
	ReleaserName			NVARCHAR(50),			--发布人姓名
	ReleaserDepart			NVARCHAR(50),			--发布人所在部门
	ReleaseTime				DATETIME,				--发布时间
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbSysLog
-- 描    述	: 日志信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbSysLog') IS NOT NULL
BEGIN
	DROP TABLE TbSysLog
	PRINT '<<< DROPPER TABLE TbSysLog! >>>'
END
GO
CREATE TABLE TbSysLog
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	UserId					VARCHAR(32),			--操作用户ID
	UserAccount				VARCHAR(50),			--操作用户账号
	UserName				NVARCHAR(100),			--操作用户姓名
	UserDepart				NVARCHAR(50),			--操作用户所在部门
	OperateIp				VARCHAR(50),			--操作IP
	OperateModule			NVARCHAR(50),			--操作模块
	OperateInfo				NVARCHAR(2000),			--操作内容
	OperateTime				DATETIME,				--操作时间
	OperateResult			NVARCHAR(200),			--操作结果
	ExceptionInfo			NVARCHAR(4000),			--操作异常信息
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
信息管理
	音频管理
	视频管理
	栏目管理
	文章管理
	互动投票
	在线留言
	联系我们
***********************************************************************************************/

-- **********************************************************************************************
-- 表    名	: TbInfoAudio
-- 描    述	: 音频管理
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoAudio') IS NOT NULL
BEGIN
	DROP TABLE TbInfoAudio;
	PRINT '<<< DROPPER TABLE TbInfoAudio! >>>'
END
GO
CREATE TABLE TbInfoAudio
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	AudioType				VARCHAR(50),			--音频类型(字典)
	AudioTitle				NVARCHAR(100),			--显示标题
	CoverImage				VARCHAR(2000),			--封面图
	AudioPath				VARCHAR(2000),			--音频路径
	Summary					NVARCHAR(500),			--摘要
	Content					NVARCHAR(MAX),			--正文
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoVideo
-- 描    述	: 视频管理
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVideo') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVideo;
	PRINT '<<< DROPPER TABLE TbInfoVideo! >>>'
END
GO
CREATE TABLE TbInfoVideo
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	VideoType				VARCHAR(50),			--视频类型(字典)
	VideoTitle				NVARCHAR(100),			--显示标题
	CoverImage				VARCHAR(2000),			--封面图
	Origin					INT,					--来源[1:上传、2:腾讯视频]
	VideoPath				VARCHAR(2000),			--视频路径
	TencentVideoCode		VARCHAR(2000),			--腾讯视频通用代码
	Summary					NVARCHAR(500),			--摘要
	Content					NVARCHAR(MAX),			--正文
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoColumn
-- 描    述	: 栏目信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoColumn') IS NOT NULL
BEGIN
	DROP TABLE TbInfoColumn
	PRINT '<<< DROPPER TABLE TbInfoColumn! >>>'
END
GO
CREATE TABLE TbInfoColumn
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Pid						VARCHAR(32) NOT NULL,	--父节点Id
	ColumnName				VARCHAR(50) NOT NULL,	--栏目名称
	ColumnCode				VARCHAR(50),			--栏目编码[来源于字典：产品product, 新闻news, 招聘recruit, 关于我们abouts, 联系我们contact, 案例case, 证书cert]
	ColumnDesc				NVARCHAR(1000),			--栏目描述
	ColumnState				INT,					--栏目状态[0:禁用、1:启用]
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoColumnBanner
-- 描    述	: 栏目横幅图片信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoColumnBanner') IS NOT NULL
BEGIN
	DROP TABLE TbInfoColumnBanner
	PRINT '<<< DROPPER TABLE TbInfoColumnBanner! >>>'
END
GO
CREATE TABLE TbInfoColumnBanner
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	ColumnId				VARCHAR(32) NOT NULL,	--栏目Id
	ImageName				VARCHAR(100),			--图片文件名称
	ImagePath				VARCHAR(2000),			--图片文件地址
	ImageSize				VARCHAR(100),			--图片文件尺寸
	LinkUrl					VARCHAR(1000),			--图片外链url
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoArticle
-- 描    述	: 文章信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoArticle') IS NOT NULL
BEGIN
	DROP TABLE TbInfoArticle
	PRINT '<<< DROPPER TABLE TbInfoArticle! >>>'
END
GO
CREATE TABLE TbInfoArticle
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	ColumnId				VARCHAR(32) NOT NULL,	--栏目Id
	Title					NVARCHAR(200) NOT NULL,	--标题
	Summary					NVARCHAR(500),			--摘要
	Content					NVARCHAR(MAX),			--内容
	CoverImage				VARCHAR(2000),			--封面图
	IsRelease				INT,					--是否发布[0:否、1:是]
	Releaser				VARCHAR(32),			--发布用户Id
	ReleaseUser				NVARCHAR(50),			--发布人(输入)
	ReleaseUnit				NVARCHAR(100),			--发布单位(输入)
	ReleaseTime				DATETIME,				--发布时间
	Origin					NVARCHAR(100),			--来源
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoArticleImage
-- 描    述	: 文章图片信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoArticleImage') IS NOT NULL
BEGIN
	DROP TABLE TbInfoArticleImage
	PRINT '<<< DROPPER TABLE TbInfoArticleImage! >>>'
END
GO
CREATE TABLE TbInfoArticleImage
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	ArticleId				VARCHAR(32) NOT NULL,	--文章Id
	ImageName				NVARCHAR(100),			--图片文件名称
	ImagePath				VARCHAR(2000),			--图片文件地址
	ImageSize				VARCHAR(100),			--图片文件尺寸
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoArticleMedia
-- 描    述	: 文章多媒体信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoArticleMedia') IS NOT NULL
BEGIN
	DROP TABLE TbInfoArticleMedia
	PRINT '<<< DROPPER TABLE TbInfoArticleMedia! >>>'
END
GO
CREATE TABLE TbInfoArticleMedia
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	ArticleId				VARCHAR(32) NOT NULL,	--文章Id
	MediaId					VARCHAR(32) NOT NULL,	--多媒体Id
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoVote
-- 描    述	: 投票信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVote') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVote
	PRINT '<<< DROPPER TABLE TbInfoVote! >>>'
END
GO
CREATE TABLE TbInfoVote
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	VoteSubject				NVARCHAR(100) NOT NULL,	--投票主题
	StartTime				DATETIME,				--投票开始时间
	EndTime					DATETIME,				--投票结束时间
	VoteState				INT,					--投票状态[0:禁用、1:正常]
	VoteMode				INT,					--投票方式[0:单选、1:多选]
	MultiOptionQuantity		INT,					--投票多选可选数目
	SortMode				VARCHAR(50),			--投票选项显示排序方式[字典]
	SetVoteQuantityShow		INT,					--是否显示实时票数[0:隐藏、1:显示]
	SetPreventBrush			INT,					--设置验证防刷[0:关闭、1:开启]
	SetResultShowMode		INT,					--结果可见方式[0:所有人、1:管理员]
	SetVoteChance			INT,					--设置投票机会[0:仅1次、1:每天1次]
	VoteTotalQuantity		INT,					--投票总票数
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoVoteOption
-- 描    述	: 投票选项信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVoteOption') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVoteOption
	PRINT '<<< DROPPER TABLE TbInfoVoteOption! >>>'
END
GO
CREATE TABLE TbInfoVoteOption
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	VoteId					VARCHAR(32) NOT NULL,	--投票Id
	OptionNum				INT,					--选项编号
	OptionImage				VARCHAR(2000),			--选项图片
	OptionText				NVARCHAR(100),			--选项文字
	OptionContent			NVARCHAR(MAX),			--选项详情
	VoteQuantity			INT,					--当前票数
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoVoteRecord
-- 描    述	: 投票记录信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoVoteRecord') IS NOT NULL
BEGIN
	DROP TABLE TbInfoVoteRecord
	PRINT '<<< DROPPER TABLE TbInfoVoteRecord! >>>'
END
GO
CREATE TABLE TbInfoVoteRecord
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	VoteId					VARCHAR(32) NOT NULL,	--投票Id
	OptionId				VARCHAR(32) NOT NULL,	--投票选项Id
	MemberId				VARCHAR(32) NOT NULL,	--会员Id
	VoteTime				DATETIME,				--投票时间
	VoteOrigin				INT,					--投票来源[0:网站、1:手机、2:微信小程序]
	VoteIp					VARCHAR(50),			--投票Ip
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
-- 表    名	: TbInfoMessage
-- 描    述	: 在线留言信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoMessage') IS NOT NULL
BEGIN
	DROP TABLE TbInfoMessage
	PRINT '<<< DROPPER TABLE TbInfoMessage! >>>'
END
GO
CREATE TABLE TbInfoMessage
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Contacter				NVARCHAR(100),			--联系人姓名
	Mobile					VARCHAR(50),			--手机
	LinkTel					VARCHAR(50),			--联系电话
	LinkAddress				NVARCHAR(500),			--联系地址
	Email					VARCHAR(200),			--邮箱
	MessageContent			NVARCHAR(1000),			--留言内容
	MessageTime				DATETIME,				--留言时间
	MessageIp				VARCHAR(50),			--留言Ip
	Replyer					VARCHAR(32),			--回复人Id
	ReplyContent			NVARCHAR(1000),			--回复内容
	ReplyTime				DATETIME,				--回复时间
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoContact
-- 描    述	: 联系我们信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoContact') IS NOT NULL
BEGIN
	DROP TABLE TbInfoContact
	PRINT '<<< DROPPER TABLE TbInfoContact! >>>'
END
GO
CREATE TABLE TbInfoContact
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Title					NVARCHAR(100),			--标题
	LinkAddress				NVARCHAR(500),			--联系地址
	LinkTel					VARCHAR(200),			--联系电话(多个)
	Fax						VARCHAR(50),			--传真
	PostalCode				VARCHAR(10),			--邮编
	Email					VARCHAR(200),			--邮箱
	ProvinceId				VARCHAR(32),			--省份Id
	ProvinceName			NVARCHAR(50),			--省份名称
	CityIdArray				VARCHAR(2000),			--所在城市Id集合
	CityNameArray			VARCHAR(2000),			--所在城市名称集合
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbInfoConfig
-- 描    述	: 配置信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoConfig') IS NOT NULL
BEGIN
	DROP TABLE TbInfoConfig
	PRINT '<<< DROPPER TABLE TbInfoConfig! >>>'
END
GO
CREATE TABLE TbInfoConfig
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	ConfigCode				VARCHAR(50),			--配置项编号
	ConfigValue				NVARCHAR(2000),			--配置项值
	ConfigDesc				NVARCHAR(1000),			--配置项描述
	ConfigCate				VARCHAR(50),			--所属分类[字典：商品设置、消息通知、会员成长]
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
商品设置信息
	（微信支付开启、微信支付商户号、微信支付秘钥、当面支付开启、到店支付开启、上门支付开启、
	是否显示订单量、订单量文案、是否显示剩余量、剩余量文案、价格单位文案、购买按钮文案、
	浏览权限设置、选择人群设置、指定等级设置、指定标签设置）
	（邮件通知开启、接收通知的邮箱、邮箱通知内容、短信通知开启、管理员手机、手机通知内容、会员短信通知开启）
*/


-- **********************************************************************************************
-- 表    名	: TbInfoLabel
-- 描    述	: 标签信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbInfoLabel') IS NOT NULL
BEGIN
	DROP TABLE TbInfoLabel
	PRINT '<<< DROPPER TABLE TbInfoLabel! >>>'
END
GO
CREATE TABLE TbInfoLabel
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	LabelName				NVARCHAR(50),			--标签名称
	LabelDesc				NVARCHAR(1000),			--标签描述
	LabelCate				VARCHAR(50),			--所属分类[字典：商品、会员]
	LabelMemberCount		INT,					--标签会员数
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
商品管理
	商品分类
	商品标签
	商品信息
	商品设置
	订单管理
	消息通知
***********************************************************************************************/
-- **********************************************************************************************
-- 表    名	: TbGoodsClassify
-- 描    述	: 商品分类表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoodsClassify') IS NOT NULL
BEGIN
	DROP TABLE TbGoodsClassify
	PRINT '<<< DROPPER TABLE TbGoodsClassify! >>>'
END
GO
CREATE TABLE TbGoodsClassify
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Pid						VARCHAR(32) NOT NULL,	--父节点Id
	ClassifyName			NVARCHAR(50),			--分类名称
	ClassifyDesc			NVARCHAR(1000),			--分类描述
	CoverImage				VARCHAR(2000),			--封面图
	ClassifyState			INT,					--状态[0:禁用、1:启用]
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbGoods
-- 描    述	: 商品信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoods') IS NOT NULL
BEGIN
	DROP TABLE TbGoods
	PRINT '<<< DROPPER TABLE TbGoods! >>>'
END
GO
CREATE TABLE TbGoods
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	GoodsName				NVARCHAR(50) NOT NULL,	--商品名称
	ClassifyId				NVARCHAR(32),			--分类Id
	ClassifyName			NVARCHAR(50),			--分类名称
	GoodsCode				VARCHAR(50),			--商品编号
	CoverImage				VARCHAR(2000),			--封面图
	Summary					NVARCHAR(500),			--摘要
	PriceType				INT,					--价格类型[0:默认、1:免费、2:面议]
	SalePrice				DECIMAL(8, 2),			--销售价
	PromotionPrice			DECIMAL(8, 2),			--促销价
	PriceUnitType			INT,					--价格单位类型[0:默认、1:自定义]
	PriceUnitText			NVARCHAR(50),			--价格单位名称,
	GoodsLabel				NVARCHAR(1000),			--商品标签
	GoodsBrand				NVARCHAR(50),			--商品品牌
	GoodsDetail				NVARCHAR(MAX),			--商品详情
	SetLimitGoodsQuantity	INT,					--是否限制商品总量[0:否、1:是]
	GoodsQuantity			INT,					--商品总量
	SetPurchase				INT,					--是否限购[0:关闭、1:开启]
	PurchaseType			INT,					--限购类型[0:总计、1:每月、2:每周、3:每天]
	PurchaseQuantity		INT,					--限购数量
	ReachLimitPrompt		NVARCHAR(100),			--达到上限提示
	BrowsePermission		INT,					--浏览权限[0:默认、1:自定义]
	SelectCrowd				INT,					--选择人群[0:指定等级、1:指定标签]
	MemberLevelId			VARCHAR(32),			--指定会员等级id
	MemberLabelInfo			VARCHAR(2000),			--指定会员标签集合
	StockPriceSet			INT,					--库存价格设置[0:默认、1:自定义]
	StockQuantitySet		INT,					--库存数量设置[0:默认、1:自定义]
	StockPurchaseSet		INT,					--库存限购设置[0:默认、1:自定义]
	StockIsAllPurchase		INT,					--库存规格是否全部限购[0:否、1:是]
	StockTotalQuantity		INT,					--库存总数量
	RemainQuantity			INT,					--剩余数量
	OrderQuantity			INT,					--实际订单量
	DealQuantity			INT,					--实际购买量
	OnShelf					INT,					--是否上架[0:否、1:是]
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbGoodsFile
-- 描    述	: 商品文件信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoodsFile') IS NOT NULL
BEGIN
	DROP TABLE TbGoodsFile
	PRINT '<<< DROPPER TABLE TbGoodsFile! >>>'
END
GO
CREATE TABLE TbGoodsFile
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	GoodsId					VARCHAR(32) NOT NULL,	--商品Id
	FileType				INT,					--文件类型[0:图片、1:视频、2:文档]
	[FileName]				NVARCHAR(100),			--文件名称
	FilePath				VARCHAR(2000),			--文件路径
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbGoodsStock
-- 描    述	: 商品库存信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbGoodsStock') IS NOT NULL
BEGIN
	DROP TABLE TbGoodsStock
	PRINT '<<< DROPPER TABLE TbGoodsStock! >>>'
END
GO
CREATE TABLE TbGoodsStock
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	GoodsId					VARCHAR(32) NOT NULL,	--商品Id
	StockName				NVARCHAR(100),			--商品库存规格名称
	PriceType				INT,					--价格类型[0:默认、1:免费、2:面议]
	SalePrice				DECIMAL(8, 2),			--销售价
	PromotionPrice			DECIMAL(8, 2),			--促销价
	SetLimitStockQuantity	INT,					--是否限制总量[0:否、1:是]
	StockQuantity			INT,					--总量
	SetPurchase				INT,					--是否限购[0:关闭、1:开启]
	PurchaseType			INT,					--限购类型[0:总计、1:每月、2:每周、3:每天]
	PurchaseQuantity		INT,					--限购数量
	ReachLimitPrompt		NVARCHAR(100),			--达到上限提示
	RemainQuantity			INT,					--剩余数量
	OrderQuantity			INT,					--实际订单量
	DealQuantity			INT,					--实际购买量
	OnShelf					INT,					--是否上架[0:否、1:是]
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbOrder
-- 描    述	: 订单信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbOrder') IS NOT NULL
BEGIN
	DROP TABLE TbOrder
	PRINT '<<< DROPPER TABLE TbOrder! >>>'
END
GO
CREATE TABLE TbOrder
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	OrderNum				VARCHAR(50) NOT NULL,	--订单编号
	OrderTime				DATETIME,				--订单时间
	OrderState				INT,					--订单状态[0:待支付、1:已支付、2:已发货、3:已收货、4:已取消、5:待退款、6:已完成]
	OrderOrigin				INT,					--订单来源[1:网站订单、2:微信小程序订单、3:手机订单]
	GoodsId					VARCHAR(32) NOT NULL,	--商品Id
	GoodsName				NVARCHAR(50),			--商品名称
	CoverImage				VARCHAR(2000),			--封面图
	GoodsStockId			VARCHAR(32),			--商品库存Id
	GoodsStockName			NVARCHAR(100),			--商品库存规格名称
	GoodsClassifyId			NVARCHAR(32),			--商品分类Id
	GoodsClassifyName		NVARCHAR(50),			--商品分类名称
	UnitPrice				DECIMAL(10, 2),			--单价
	OrderQuantity			INT,					--订单数量
	OrderAmount				DECIMAL(10, 2),			--订单金额
	DiscountAmount			DECIMAL(10, 2),			--优惠金额
	PayMethod				INT,					--支付方式
	PayAmount				DECIMAL(10, 2),			--支付金额
	PayTime					DATETIME,				--支付时间
	DeliveryTime			DATETIME,				--发货时间
	ReceiveTime				DATETIME,				--收货时间
	CancelTime				DATETIME,				--取消时间
	CancelReason			NVARCHAR(500),			--取消原因
	ApplyRefundTime			DATETIME,				--申请退款时间
	ApplyRefundReason		NVARCHAR(500),			--申请退款原因
	RefundTime				DATETIME,				--退款时间
	FinishTime				DATETIME,				--完成时间
	CourierCompany			NVARCHAR(200),			--快递公司
	CourierNum				VARCHAR(50),			--快递单号
	CourierSnapshot			VARCHAR(2000),			--快递快照图片
	MemberId				VARCHAR(32),			--会员Id
	MemberName				NVARCHAR(100),			--会员名称
	MemberAvatar			VARCHAR(2000),			--会员头像
	BuyerName				NVARCHAR(100),			--买家名称
	BuyerMobile				VARCHAR(50),			--买家手机
	BuyerAddress			NVARCHAR(500),			--买家地址
	BuyerMessage			NVARCHAR(1000),			--买家留言
	Remark					NVARCHAR(2000),			--备注
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbOrderRecord
-- 描    述	: 订单操作记录信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbOrderRecord') IS NOT NULL
BEGIN
	DROP TABLE TbOrderRecord
	PRINT '<<< DROPPER TABLE TbOrderRecord! >>>'
END
GO
CREATE TABLE TbOrderRecord
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	OrderId					VARCHAR(32) NOT NULL,	--订单Id
	OrderNum				VARCHAR(50),			--订单编号
	OrderState				INT,					--订单状态[0:待支付、1:已支付、2:已发货、3:已收货、4:已取消、5:待退款、6:已完成]
	RecordTime				DATETIME,				--记录时间
	RecordDesc				NVARCHAR(1000),			--记录描述
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
客户管理
	访客管理
	会员等级
	会员成长
	会员权益
	会员标签
	会员管理
***********************************************************************************************/
-- **********************************************************************************************
-- 表    名	: TbVisitor
-- 描    述	: 访客信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbVisitor') IS NOT NULL
BEGIN
	DROP TABLE TbVisitor
	PRINT '<<< DROPPER TABLE TbVisitor! >>>'
END
GO
CREATE TABLE TbVisitor
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	VisitIp					VARCHAR(50),			--访问Ip
	MemberId				VARCHAR(32),			--会员Id
	WxOpenId				VARCHAR(100),			--微信openid
	Avatar					VARCHAR(2000),			--头像
	NickName				NVARCHAR(100),			--昵称
	Mobile					VARCHAR(50),			--手机
	Intention				INT,					--意向度[0:低意向、1:中意向、2:高意向]
	LastActiveTime			DATETIME,				--最近活跃时间
	FirstVisitTime			DATETIME,				--首访时间
	Terminal				INT,					--终端[0:网站、1:手机、2:微信小程序]
	Origin					INT,					--来源[0:自来、1:其他]
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbVisitRecord
-- 描    述	: 访客记录表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbVisitRecord') IS NOT NULL
BEGIN
	DROP TABLE TbVisitRecord
	PRINT '<<< DROPPER TABLE TbVisitRecord! >>>'
END
GO
CREATE TABLE TbVisitRecord
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	VisitorId				VARCHAR(32),			--访客Id
	Avatar					VARCHAR(2000),			--头像
	NickName				NVARCHAR(100),			--昵称
	Intention				INT,					--意向度[0:低意向、1:中意向、2:高意向]
	RecordTime				DATETIME,				--记录时间
	RecordDesc				NVARCHAR(1000),			--记录描述
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
-- 表    名	: TbMemberLevel
-- 描    述	: 会员等级表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberLevel') IS NOT NULL
BEGIN
	DROP TABLE TbMemberLevel
	PRINT '<<< DROPPER TABLE TbMemberLevel! >>>'
END
GO
CREATE TABLE TbMemberLevel
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	LevelCode				VARCHAR(50),			--等级编号
	LevelName				NVARCHAR(50),			--等级名称
	Integral				INT,					--等级积分
	RightCount				INT,					--权益数目
	MemberCount				INT,					--会员数目
	Icon					VARCHAR(2000),			--图标
	RightDesc				NVARCHAR(1000),			--权益说明
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbMemberRight
-- 描    述	: 会员权益表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberRight') IS NOT NULL
BEGIN
	DROP TABLE TbMemberRight
	PRINT '<<< DROPPER TABLE TbMemberRight! >>>'
END
GO
CREATE TABLE TbMemberRight
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	RightName				NVARCHAR(50),			--权益名称
	RightDesc				NVARCHAR(1000),			--权益描述
	RightIcon				VARCHAR(2000),			--权益图标
	SetShow					INT,					--是否显示[0:否、1:是]
	SortIndex				INT,					--排序号
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbMemberLevelRight
-- 描    述	: 会员等级权益表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberLevelRight') IS NOT NULL
BEGIN
	DROP TABLE TbMemberLevelRight
	PRINT '<<< DROPPER TABLE TbMemberLevelRight! >>>'
END
GO
CREATE TABLE TbMemberLevelRight
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	LevelId					VARCHAR(32),			--等级Id
	RightId					VARCHAR(32),			--权益Id
	RightName				NVARCHAR(50),			--权益名称
	Discount				DECIMAL(5, 2),			--折扣值
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
-- 表    名	: TbMember
-- 描    述	: 会员信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbMember') IS NOT NULL
BEGIN
	DROP TABLE TbMember
	PRINT '<<< DROPPER TABLE TbMember! >>>'
END
GO
CREATE TABLE TbMember
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	Account					VARCHAR(50) NOT NULL,	--账号
	[Password]				VARCHAR(300),			--登录密码
	NickName				NVARCHAR(100),			--昵称
	RealName				NVARCHAR(100),			--姓名
	Gender					CHAR(1),				--性别[M男、F女、U未知]
	Avatar					VARCHAR(2000),			--头像
	Mobile					VARCHAR(50),			--手机号
	LinkTel					VARCHAR(50),			--联系电话
	LinkAddress				NVARCHAR(500),			--联系地址
	Birthday				DATETIME,				--出生年月
	IdCardNo				VARCHAR(50),			--身份证号
	Email					VARCHAR(200),			--邮箱
	Wechat					VARCHAR(50),			--微信号
	UserState				INT,					--用户状态[0停用、1激活、2禁用]
	WxOpenId				VARCHAR(100),			--微信openid
	WxSessionKey			VARCHAR(200),			--微信sessionkey
	City					NVARCHAR(50),			--所在城市
	Province				NVARCHAR(50),			--所在省份
	Country					NVARCHAR(50),			--所在国家
	LevelId					VARCHAR(32),			--等级Id
	LevelCode				VARCHAR(50),			--等级编号
	LevelName				NVARCHAR(50),			--等级名称
	LabelIdArray			VARCHAR(2000),			--标签Id集合
	LabelArray				VARCHAR(2000),			--标签集合
	Integral				INT,					--积分
	Balance					DECIMAL(10, 2),			--账户余额
	OrderCount				INT,					--订单总数
	DealAmount				DECIMAL(10, 2),			--成交金额
	PayPassword				VARCHAR(300),			--支付密码
	RegisterTime			DATETIME,				--注册时间
	MemberShipTime			DATETIME,				--成为会员时间
	Origin					INT,					--来源[0:注册、1:微信小程序]
	Remark					NVARCHAR(2000),			--备注
	IsDeleted				INT,					--是否删除[0:否、1:是]
	Creater					VARCHAR(32),			--创建人Id
	CreateTime				DATETIME,				--创建时间
	Updater					VARCHAR(32),			--修改人Id
	UpdateTime				DATETIME,				--修改时间
	Deleter					VARCHAR(32),			--删除人Id
	DeleteTime				DATETIME,				--删除时间
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
-- 表    名	: TbMemberIntegral
-- 描    述	: 会员积分记录信息表
-- 创建日期	: 2021-05-06
-- 创建者	:
-- 修改记录	:
-- **********************************************************************************************
IF OBJECT_ID('TbMemberIntegral') IS NOT NULL
BEGIN
	DROP TABLE TbMemberIntegral
	PRINT '<<< DROPPER TABLE TbMemberIntegral! >>>'
END
GO
CREATE TABLE TbMemberIntegral
(
	Id						VARCHAR(32) NOT NULL,	--主键Id
	MemberId				VARCHAR(32) NOT NULL,	--会员Id
	Integral				INT,					--积分数
	IntegralTime			DATETIME,				--积分时间
	IntegralRule			NVARCHAR(100),			--积分规则
	IntegralDesc			NVARCHAR(500),			--积分描述
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



