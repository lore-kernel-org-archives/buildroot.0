Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8948C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FFA940924;
	Sun, 16 Oct 2022 15:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFA940924
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu6jui-0JeyF; Sun, 16 Oct 2022 15:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8E9B40919;
	Sun, 16 Oct 2022 15:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E9B40919
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97D31BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F5E660C20
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5E660C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-QD9CSdXmGI for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 348FB60E7A
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 348FB60E7A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31E1686751; Sun, 16 Oct 2022 15:04:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:01:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db63f65945527527f90b58113d9a56fbcd49c275
X-Git-Newrev: 51812c339078e5db20ef8dec06b24c36a0d22208
X-Patchwork-Hint: ignore
Message-Id: <20221016150425.31E1686751@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lualogging: bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=51812c339078e5db20ef8dec06b24c36a0d22208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
-Copyright (c) 2004-2021 Kepler Project.
+Copyright (c) 2004-2022 Kepler Project.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lualogging/lualogging.hash | 4 ++--
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 1fc8694e84..a9eadab4d1 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  d29c9c78e4266d9390069b2a5f7afacfcf9189dea12ce3774a5aa4e3cdbcd89f  lualogging-1.6.0-1.src.rock
-sha256  4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
+sha256  d4a8791e9b24840c4a4c0366399f55b6deb060fc3947f3a9aae9ced0334160c1  lualogging-1.7.0-1.src.rock
+sha256  d900082cb26f8cf4a491ca51c00241f2c2e9cd9ae3531c62234017a360706adb  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 4d01f546e9..78197f6be6 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.6.0-1
+LUALOGGING_VERSION = 1.7.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
