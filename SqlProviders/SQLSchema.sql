/****** Object:  Table [dbo].[tc_Identity]    Script Date: 06/05/2007 07:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tc_Identity](
	[Identity] [nvarchar](200) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[LastSuccessfulLogin] [datetime] NULL,
	[LastPasswordChange] [datetime] NOT NULL CONSTRAINT [DF_tc_Identity_LastPasswordChange]  DEFAULT (getdate()),
	[MustChangePassword] [bit] NOT NULL CONSTRAINT [DF_tc_Identity_MustChangePassword]  DEFAULT ((0)),
	[FailedLoginAttempts] [int] NOT NULL CONSTRAINT [DF_tc_Identity_FailedLoginAttempts]  DEFAULT ((0)),
	[LockedByUserAction] [datetime] NOT NULL CONSTRAINT [DF_tc_Identity_LockedByUserAction]  DEFAULT ('1900 Jan 01'),
 CONSTRAINT [PK_tc_Identity] PRIMARY KEY CLUSTERED 
(
	[Identity] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tc_Activity]    Script Date: 06/05/2007 07:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tc_Activity](
	[Id] [uniqueidentifier] NOT NULL,
	[DescriptionId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](500) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Duration] [int] NOT NULL,
	[CrossTabDescriptionId] [uniqueidentifier] NULL,
	[CustomFlags] [int] NULL,
	[UserId] [nvarchar](200) NOT NULL,
	[SourceMachine] [nvarchar](200) NOT NULL,
	[OriginalDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TaskClerkActivity] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [IX_tc_Activity] ON [dbo].[tc_Activity] 
(
	[StartDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique id for the task.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tc_Activity', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The source machine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tc_Activity', @level2type=N'COLUMN',@level2name=N'SourceMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tc_Activity'
GO
/****** Object:  Table [dbo].[tc_UserMemory]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tc_UserMemory](
	[SettingKey] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](200) NOT NULL,
	[SettingValue] [varbinary](max) NULL,
 CONSTRAINT [PK_tc_UserMemory] PRIMARY KEY CLUSTERED 
(
	[SettingKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[TCServerName]    Script Date: 06/05/2007 07:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TCServerName] 
(
)
RETURNS nvarchar(500)
AS
BEGIN

	DECLARE @ResultVar nvarchar(500)
	SELECT @ResultVar = [Value] FROM tc_ServerSettings WHERE [Key] = 'ServerName'
	RETURN @ResultVar

END
GO
/****** Object:  Table [dbo].[tc_ServerSettings]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tc_ServerSettings](
	[Key] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tc_ServerSettings] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[up_SecurityRoleCheck]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_SecurityRoleCheck]
	@UserId nvarchar(200),
	@Role nvarchar(200),
	@ProcName nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	-- If the supplied user does not have the required role
	-- Return an error


END
GO
/****** Object:  Table [dbo].[tc_Log]    Script Date: 06/05/2007 07:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tc_Log](
	[UserId] [nvarchar](200) NOT NULL,
	[ActionDate] [datetime] NOT NULL,
	[Action] [nvarchar](200) NOT NULL,
	[ExtraInformation] [nvarchar](200) NULL,
 CONSTRAINT [PK_tc_Log] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ActionDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tc_Role]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tc_Role](
	[RoleId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_tc_Role_RoleId]  DEFAULT (newid()),
	[Role] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_tc_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tc_Description]    Script Date: 06/05/2007 07:18:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tc_Description](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[NoNagMinutes] [int] NULL CONSTRAINT [DF_TaskClerkDescriptions_NoNagMinutes]  DEFAULT ((0)),
	[Colour] [nvarchar](200) NULL,
	[Sequence] [int] NULL,
	[CustomFlags] [int] NULL,
	[IsPrivate] [bit] NULL,
	[IsCategory] [bit] NULL,
	[IsEvent] [bit] NULL CONSTRAINT [DF_TaskClerkDescriptions_IsEnabled]  DEFAULT ((1)),
	[GroupName] [nvarchar](200) NULL,
	[MenuColumn] [int] NULL,
	[Url] [nvarchar](200) NULL,
	[Server] [nvarchar](200) NULL,
	[ValidFromDate] [datetime] NULL,
	[ValidToDate] [datetime] NULL,
	[Enabled] [bit] NULL CONSTRAINT [DF_tc_Description_Enabled]  DEFAULT ((1)),
 CONSTRAINT [PK_TaskClerkDescriptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[up_ChangePassword]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_ChangePassword] 
	@UserName	    nvarchar(200),
	@OldPassword	nvarchar(200),
	@NewPassword	nvarchar(200)
AS
-- =============================================
-- Author:		John Powell
-- Create date: 01 June 2007
-- Description:	This procedure allows a user to change 
--				their current password.
-- =============================================
BEGIN

	SET NOCOUNT ON;

	-- Security Check Aspect
	DECLARE @UserId nvarchar(200)
	SELECT @UserId = Indentity FROM tc_Indentity WHERE UserName = @UserName	
	DECLARE @ProcName nvarchar(200)
	SET @ProcName = OBJECT_NAME(@@PROCID)	
	EXEC up_SecurityRoleCheck @UserId, 'User', @ProcName

	IF EXISTS(SELECT 1 FROM tc_Identity WHERE [UserName] = @UserName AND [Password] = @OldPassword)
	BEGIN
		UPDATE
			tc_Identity
		SET
			[Password] = @NewPassword,
			[LastPasswordChange] = getdate(),
			[MustChangePassword] = 0,
			[FailedLoginAttempts] = 0
		WHERE
			[UserName] = @UserName AND [Password] = @OldPassword
		
		-- Log Change Password Action
		INSERT tc_Log
		VALUES (@UserId, getdate(), @ProcName, 'Password changed successfully.')

		RETURN
	END

	-- Log Change Password Failed Action
	INSERT tc_Log
	VALUES (@UserId, getdate(), @ProcName, 'Password change failed.')

	RAISERROR(N'Password change failed.', 16, 1)
	RETURN

END
GO
/****** Object:  StoredProcedure [dbo].[up_DiscoverIdentity]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_DiscoverIdentity]
	@UserName nvarchar(200),
	@Password nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @UserId nvarchar(200)
	SELECT @UserId = [Identity] FROM tc_Identity WHERE UserName = @UserName	
	IF(@UserId IS NULL)
	BEGIN
		SET @UserId = 'Anonymous'
	END
	DECLARE @ProcName nvarchar(200)
	SET @ProcName = OBJECT_NAME(@@PROCID)

	DECLARE @Identity nvarchar(200)
	DECLARE @ErrorString nvarchar(200)

	IF EXISTS(SELECT 1 FROM dbo.tc_Identity
		WHERE
			(UserName = @UserName) AND (Password = @Password) AND     
			(FailedLoginAttempts <= 3) AND (MustChangePassword = 0) AND 
			(LockedByUserAction < DATEADD(hh, - 1, GETDATE())))
	BEGIN

		SELECT     
			@Identity = [Identity]
		FROM
			dbo.tc_Identity
		WHERE
			(UserName = @UserName) AND (Password = @Password) AND     
			(FailedLoginAttempts <= 3) AND (MustChangePassword = 0) AND 
			(LockedByUserAction < DATEADD(hh, - 1, GETDATE()))

		UPDATE
			dbo.tc_Identity
		SET
			LastSuccessfulLogin = getdate(),
			FailedLoginAttempts = 0
		WHERE
			[Identity] = @Identity

		SELECT @Identity

	END
	ELSE
	BEGIN

		IF EXISTS(SELECT 1 FROM dbo.tc_Identity
		WHERE
			(UserName = @UserName) AND (Password = @Password) AND     
			(MustChangePassword = 1))
		BEGIN
			SET @ErrorString = N'You are required to change your password.'
			RAISERROR(@ErrorString, 16, 1)
			-- Log Failed Discover Identity Action
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, @ErrorString)
			RETURN
		END

		IF NOT EXISTS(SELECT 1 FROM dbo.tc_Identity WHERE (UserName = @UserName))
		BEGIN
			SET @ErrorString = N'The supplied credentials combination is invalid.'
			RAISERROR(@ErrorString, 16, 1)
			-- Log Failed Discover Identity Action
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, @ErrorString)
			RETURN
		END

		IF EXISTS(SELECT 1 FROM dbo.tc_Identity WHERE (UserName = @UserName) AND (FailedLoginAttempts < 3))
		BEGIN
			UPDATE
				dbo.tc_Identity
			SET
				FailedLoginAttempts = FailedLoginAttempts + 1
			WHERE
				UserName = @UserName
			
			SET @ErrorString = N'The supplied credentials combination is invalid.'
			RAISERROR(@ErrorString, 16, 1)
			-- Log Failed Discover Identity Action
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, @ErrorString)
			RETURN
		END

		IF EXISTS(SELECT 1 FROM dbo.tc_Identity
		WHERE
			(UserName = @UserName) AND     
			(LockedByUserAction > DATEADD(hh, - 1, GETDATE())))
		BEGIN
			SET @ErrorString = N'The account is locked.'
			RAISERROR(@ErrorString, 16, 1)
			-- Log Failed Discover Identity Action
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, @ErrorString)
			RETURN
		END

		IF EXISTS(SELECT 1 FROM dbo.tc_Identity
		WHERE
			(UserName = @UserName) AND     
			(FailedLoginAttempts >= 3))
		BEGIN
			UPDATE dbo.tc_Identity SET LockedByUserAction = getdate() WHERE UserName = @UserName
			SET @ErrorString = N'The account has been locked.'
			RAISERROR(@ErrorString, 16, 1)
			-- Log Failed Discover Identity Action
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, @ErrorString)
			RETURN
		END
	END	

	-- Log Discover Identity Action
	INSERT tc_Log
	VALUES (@UserId, getdate(), @ProcName, @UserName)

END
GO
/****** Object:  StoredProcedure [dbo].[up_WriteActivity]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_WriteActivity]
	@Id	uniqueidentifier,
	@DescriptionId	uniqueidentifier,
	@Remarks	nvarchar(500) = null,
	@StartDate	datetime,
	@EndDate	datetime = null,
	@Duration	int,
	@CrossTabDescriptionId	uniqueidentifier = null,
	@CustomFlags	int,
	@UserId	nvarchar(200),
	@SourceMachine	nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM tc_Activity WHERE Id = @Id)
	BEGIN
		UPDATE tc_Activity
		SET	DescriptionId = @DescriptionId,
			Remarks = @Remarks,
			StartDate = @StartDate,
			EndDate = @EndDate,
			Duration = @Duration,
			CrossTabDescriptionId = @CrossTabDescriptionId,
			CustomFlags = @CustomFlags,
			UserId = @UserId,
			SourceMachine = @SourceMachine
		WHERE
			Id = @Id
	END
	ELSE
	BEGIN
		INSERT tc_Activity
			( Id, DescriptionId, Remarks, StartDate, EndDate, Duration, 
				CrossTabDescriptionId, CustomFlags, UserId, SourceMachine, OriginalDate)
		VALUES 
			(@Id, @DescriptionId, @Remarks, @StartDate, @EndDate, @Duration, 
				@CrossTabDescriptionId, @CustomFlags, @UserId, @SourceMachine, getdate())

	END

END
GO
/****** Object:  StoredProcedure [dbo].[up_ReadActivities]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_ReadActivities]
	@StartDate	datetime,
	@EndDate	datetime,
	@UserId	nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Id]
		  ,[DescriptionId]
		  ,[Remarks]
		  ,[StartDate]
		  ,[EndDate]
		  ,[Duration]
		  ,[CrossTabDescriptionId]
		  ,[CustomFlags]
		  ,[UserId]
		  ,[OriginalDate]
	  FROM [TaskClerkPrivate].[dbo].[tc_Activity]
	 WHERE [UserId] = @UserId AND
		   [StartDate] >= @StartDate AND
		   [StartDate] <= @EndDate AND
		   [EndDate] IS NOT null

END
GO
/****** Object:  StoredProcedure [dbo].[up_DeleteActivity]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_DeleteActivity]
	@Id	uniqueidentifier,
	@UserId	nvarchar(200)
AS
-- =============================================
-- Author:		John Powell
-- Create date: 01 June 2007
-- Description:	This procedure removes an activity from the 
--				tc_Activity table.
-- =============================================
BEGIN

	SET NOCOUNT ON;

	-- Security Check Aspect
	DECLARE @ProcName nvarchar(200)
	SET @ProcName = OBJECT_NAME(@@PROCID)
	EXEC up_SecurityRoleCheck @UserId, 'User', @ProcName

	DELETE tc_Activity
	WHERE
		Id = @Id AND
		UserId = @UserId

	-- Log Delete Action
	INSERT tc_Log
	VALUES (@UserId, getdate(), @ProcName, CONVERT(nvarchar(200), @Id))

END
GO
/****** Object:  StoredProcedure [dbo].[up_DiscoverActivities]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_DiscoverActivities] 
	@UserId	nvarchar(200),
	@Question nvarchar(200)
AS
BEGIN

	SET NOCOUNT ON;
	-- Security Check Aspect
	DECLARE @ProcName nvarchar(200)
	SET @ProcName = OBJECT_NAME(@@PROCID)
	EXEC up_SecurityRoleCheck @UserId, 'User', @ProcName

	-- make sure the returned dates are in chronological order
	if(@Question = 'AvailableDays')
	BEGIN
		SELECT distinct Convert(datetime, Convert(nvarchar(10), StartDate, 112)) FROM tc_Activity WHERE UserId = @UserId
		ORDER BY Convert(datetime, Convert(nvarchar(10), StartDate, 112))
	END

	if(@Question = 'AvailableMonths')
	BEGIN
		SELECT distinct Convert(datetime, Convert(nvarchar(6), StartDate, 112) + '01') FROM tc_Activity WHERE UserId = @UserId
		ORDER BY Convert(datetime, Convert(nvarchar(6), StartDate, 112) + '01')
	END

	if(@Question = 'AvailableYears')
	BEGIN
		SELECT distinct Convert(datetime, Convert(nvarchar(4), StartDate, 112) + '0101') FROM tc_Activity WHERE UserId = @UserId
		ORDER BY Convert(datetime, Convert(nvarchar(4), StartDate, 112) + '0101')
	END

	-- Log DiscoverActivities Action
	INSERT tc_Log
	VALUES (@UserId, getdate(), @ProcName, @Question)

END
GO
/****** Object:  StoredProcedure [dbo].[up_WriteDescription]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_WriteDescription]
	@UserId nvarchar(200),
	@Id uniqueidentifier,
	@ParentId uniqueidentifier = NULL,
	@Name nvarchar(200),
	@Description nvarchar(500) = NULL,
	@NoNagMinutes int,
	@Colour nvarchar(200),
	@Sequence int,
	@CustomFlags int,
	@IsPrivate bit,
	@IsCategory bit,
	@IsEvent bit,
	@GroupName nvarchar(200) = NULL,
	@MenuColumn int,
	@Url nvarchar(200) = NULL,
	@Server nvarchar(200) = NULL,
	@ValidFromDate datetime = NULL,
	@ValidToDate datetime = NULL,
	@Enabled bit
AS
-- =============================================
-- Author:		John Powell
-- Create date: 01 June 2007
-- Description:	This procedure inserts or updates a TaskDescription
--				in the database
-- =============================================
BEGIN

	SET NOCOUNT ON;

	-- Security Check Aspect
	DECLARE @ProcName nvarchar(200)
	SET @ProcName = OBJECT_NAME(@@PROCID)	
	EXEC up_SecurityRoleCheck @UserId, 'User', @ProcName

	-- Calculate this description servers name to ensure we don't overwrite
	-- other servers descriptions
	DECLARE  @ThisServer nvarchar(200)
	SET @ThisServer = 'tc_Server_1' --TCServerName

--	IF(@Server != @ThisServer)
--	BEGIN
--		RETURN 0
--	END

	IF EXISTS(SELECT 1 FROM [tc_Description] WHERE [Id] = @Id)
	BEGIN

		UPDATE [tc_Description]
		   SET [ParentId] = @ParentId
			  ,[Name] = @Name
			  ,[Description] = @Description
			  ,[NoNagMinutes] = @NoNagMinutes
			  ,[Colour] = @Colour
			  ,[Sequence] = @Sequence
			  ,[CustomFlags] = @CustomFlags
			  ,[IsPrivate] = @IsPrivate
			  ,[IsCategory] = @IsCategory
			  ,[IsEvent] = @IsEvent
			  ,[GroupName] = @GroupName
			  ,[MenuColumn] = @MenuColumn
			  ,[Url] = @Url
			  ,[Server] = @Server
			  ,[ValidFromDate] = @ValidFromDate
			  ,[ValidToDate] = @ValidToDate
			  ,[Enabled] = @Enabled
		 WHERE [Id] = @Id

			-- Log Insert into TaskDescription table
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, 'Update success.')

	END
	ELSE
	BEGIN

		INSERT INTO [TaskClerkPrivate].[dbo].[tc_Description]
				(
					[Id]
				   ,[ParentId]
				   ,[Name]
				   ,[Description]
				   ,[NoNagMinutes]
				   ,[Colour]
				   ,[Sequence]
				   ,[CustomFlags]
				   ,[IsPrivate]
				   ,[IsCategory]
				   ,[IsEvent]
				   ,[GroupName]
				   ,[MenuColumn]
				   ,[Url]
				   ,[Server]
				   ,[ValidFromDate]
				   ,[ValidToDate]
				   ,[Enabled]
				)
			 VALUES
				(
					@Id
				   ,@ParentId
				   ,@Name
				   ,@Description
				   ,@NoNagMinutes
				   ,@Colour
				   ,@Sequence
				   ,@CustomFlags
				   ,@IsPrivate
				   ,@IsCategory
				   ,@IsEvent
				   ,@GroupName
				   ,@MenuColumn
				   ,@Url
				   ,@Server
				   ,@ValidFromDate
				   ,@ValidToDate
				   ,@Enabled
				)

			-- Log Insert into TaskDescription table
			INSERT tc_Log
			VALUES (@UserId, getdate(), @ProcName, 'Insert success.')

	END

END
GO
/****** Object:  StoredProcedure [dbo].[up_ArchiveActivities]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_ArchiveActivities]
	@UserId	nvarchar(200)
AS
-- =============================================
-- Author:		John Powell
-- Create date: 01 June 2007
-- Description:	This procedure performs an archive action
--				on the tc_Activity table.
-- =============================================
BEGIN
	SET NOCOUNT ON;

	-- Security Check Aspect
	DECLARE @ProcName nvarchar(200)
	SET @ProcName = OBJECT_NAME(@@PROCID)
	EXEC up_SecurityRoleCheck @UserId, 'User', @ProcName

	-- There is no concept of archiving tc_Activity in the Database
	-- at this point.



	-- Log Archive Action
	INSERT tc_Log
	VALUES (@UserId, getdate(), @ProcName, null)

END
GO
/****** Object:  StoredProcedure [dbo].[up_ReadDescriptions]    Script Date: 06/05/2007 07:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_ReadDescriptions]
(
	@UserId nvarchar(200) = NULL
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * INTO #Queue FROM tc_Description WHERE ParentId IS NULL ORDER BY Sequence
	SELECT * INTO #CorrectOrder FROM tc_Description WHERE Id IS NULL

	DECLARE @Counter int
	DECLARE @WorkingWith uniqueidentifier
	SELECT @Counter = COUNT(*) FROM #Queue
	WHILE(@Counter > 0)
	BEGIN
		SELECT TOP 1 @WorkingWith = ID FROM #Queue

		INSERT #CorrectOrder
		SELECT * FROM tc_Description WHERE Id = @WorkingWith ORDER BY Sequence
		
		INSERT #Queue
		SELECT * FROM tc_Description WHERE ParentId = @WorkingWith ORDER BY Sequence
		
		DELETE #Queue WHERE Id = @WorkingWith

		SELECT @Counter = COUNT(*) FROM #Queue
	END

	SELECT [Id]
		  ,[ParentId]
		  ,[Name]
		  ,[Description]
		  ,[NoNagMinutes]
		  ,[Colour]
		  ,[Sequence]
		  ,[CustomFlags]
		  ,[IsPrivate]
		  ,[IsCategory]
		  ,[IsEvent]
		  ,[GroupName]
		  ,[MenuColumn]
		  ,[Url]
		  ,[Server]
		  ,[ValidFromDate]
		  ,[ValidToDate]
		  ,[Enabled]
	  FROM #CorrectOrder

END
GO
