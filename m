Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C84EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F9481E10;
	Sun, 16 Jul 2023 06:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F9481E10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJh4b31mzIdy; Sun, 16 Jul 2023 06:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8953E81BA9;
	Sun, 16 Jul 2023 06:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8953E81BA9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8141BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A75660737
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A75660737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfuNjAH9s62l for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E638560739
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E638560739
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D180D87034; Sun, 16 Jul 2023 06:21:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:04:57 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: b8b36712ef1d1ebf18f80d8e993d9f96be3ea6a9
X-Git-Newrev: 2851e8ed7ffd5035433027ca67e23a875e2b27e0
X-Patchwork-Hint: ignore
Message-Id: <20230716062108.D180D87034@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/audit: bump
 version to 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2851e8ed7ffd5035433027ca67e23a875e2b27e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Changelog:
https://github.com/linux-audit/audit-userspace/blob/v3.1.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit afbc2f47fb0bd820e5a98e14c2271f016b9fdce4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 87c00ec241..310b0a0f6a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  b5cf3cdabb2786c08b1de3599a3b1a547e55f7a9f9c1eb2078f5b44cf44e8378  audit-3.1.tar.gz
+sha256  46e46b37623cce09e6ee134e78d668afc34f4e1c870c853ef12e4193078cfe87  audit-3.1.1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 252f5865b5..e77e06bd6b 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.1
+AUDIT_VERSION = 3.1.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
