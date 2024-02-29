Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B2C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C60C41DB5;
	Thu, 29 Feb 2024 15:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsogP5P7tVNo; Thu, 29 Feb 2024 15:53:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC5D41DDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FC5D41DDB;
	Thu, 29 Feb 2024 15:53:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 433641BF980
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7637A60EF7
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-N9afJK-5MT for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B651360EF1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B651360EF1
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3BD387DAF; Thu, 29 Feb 2024 15:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 16:44:48 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5debf1ba6883d1dd931e61000ce24631d459d147
X-Git-Newrev: dbf74002deaad62ea5b4b3b699c27089d354c002
X-Patchwork-Hint: ignore
Message-Id: <20240229154802.B3BD387DAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/gesftpserver:
 update GESFTPSERVER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbf74002deaad62ea5b4b3b699c27089d354c002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:green_end:sftpserver has been deprecated in favor of
cpe:2.3:a:greenend:sftpserver in December 2022:

 <cpe-item name="cpe:/a:green_end:sftpserver:0.2.2" deprecated="true" deprecation_date="2022-12-30T17:53:22.797Z">
      <reference href="https://github.com/ewxrjk/sftpserver/releases">Version</reference>
      <reference href="http://www.greenend.org.uk/rjk/sftpserver/">Product</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:green_end:sftpserver:0.2.2:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:greenend:sftpserver:0.2.2:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4adc8b3d24708f180bcbf68df1d0723dc058f68e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gesftpserver/gesftpserver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 5a3ab0536c..5a7106d707 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -12,7 +12,7 @@ GESFTPSERVER_LICENSE_FILES = COPYING
 
 # "Missing prototype" warning treated as error
 GESFTPSERVER_CONF_OPTS = --disable-warnings-as-errors
-GESFTPSERVER_CPE_ID_VENDOR = green_end
+GESFTPSERVER_CPE_ID_VENDOR = greenend
 GESFTPSERVER_CPE_ID_PRODUCT = sftpserver
 
 # forgets to link against pthread when cross compiling
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
