Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D45734047D;
	Tue, 30 Nov 2021 16:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXp6iNWs_hk6; Tue, 30 Nov 2021 16:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8DC040465;
	Tue, 30 Nov 2021 16:12:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED1F51BF995
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69004046D
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaXQuHsJZBgC for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F8D7400F0
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B55DA920DE; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:09:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 526365c439c0a44e341715bf091209d41af51c40
X-Git-Newrev: 4c995498abd261481690ba0ae41f1b77892683c1
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.B55DA920DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oracle-mysql: drop spurious space
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c995498abd261481690ba0ae41f1b77892683c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oracle-mysql/oracle-mysql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 8a6bdc0097..f1f16abbb4 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -61,7 +61,7 @@ define HOST_ORACLE_MYSQL_BUILD_CMDS
 endef
 
 define HOST_ORACLE_MYSQL_INSTALL_CMDS
-	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash $(HOST_DIR)/bin/
+	$(INSTALL) -m 0755 $(@D)/sql/gen_lex_hash $(HOST_DIR)/bin/
 endef
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
