Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F57FC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 09:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E29061195;
	Sun, 20 Jul 2025 09:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLJhyFIgSN7F; Sun, 20 Jul 2025 09:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C83361063
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C83361063;
	Sun, 20 Jul 2025 09:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F6F1F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8933A61063
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-sAuPhmsM_m for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A18761084
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A18761084
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A499867C8; Sun, 20 Jul 2025 09:57:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 11:54:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 526ab2f6c048b06faf1ae5045058a8b26728fcd7
X-Git-Newrev: c72557eaf8b4fd4c1899e90c16323d7d52e0200b
X-Patchwork-Hint: ignore
Message-Id: <20250720095706.4A499867C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: add Upstream tag to patch 0001
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c72557eaf8b4fd4c1899e90c16323d7d52e0200b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                          | 1 -
 package/ntp/0001-ntp-syscalls-fallback.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f74e107adc..4591ff173a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -856,7 +856,6 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
 package/norm/0002-Use-print-as-function-call-for-Python3-compatibility.patch lib_patch.Upstream
 package/norm/0003-Fix-mixed-tabs-spaces-in-protolib-wscript.patch lib_patch.Upstream
 package/nss-pam-ldapd/S45nslcd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
-package/ntp/0001-ntp-syscalls-fallback.patch lib_patch.Upstream
 package/ntp/S49ntp.in lib_sysv.Variables
 package/ntpsec/0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch lib_patch.Upstream
 package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
diff --git a/package/ntp/0001-ntp-syscalls-fallback.patch b/package/ntp/0001-ntp-syscalls-fallback.patch
index 46704b9d3f..445efd95e5 100644
--- a/package/ntp/0001-ntp-syscalls-fallback.patch
+++ b/package/ntp/0001-ntp-syscalls-fallback.patch
@@ -1,7 +1,6 @@
 inline ntp syscalls fallback
 
-Reference:
- https://bugs.ntp.org/show_bug.cgi?id=769
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=769
 
 Signed-off-by: James Knight <james.knight@rockwellcollins.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
