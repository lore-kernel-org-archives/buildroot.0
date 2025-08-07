Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D2EC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC6F1804E0;
	Thu,  7 Aug 2025 17:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZliQYO-Ya5uu; Thu,  7 Aug 2025 17:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F3F0804EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F3F0804EF;
	Thu,  7 Aug 2025 17:19:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F7F34C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B3240487
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0cb1HfVinIT for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31CBD40490
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31CBD40490
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FEAA85C8D; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:34 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: fa1c1f83eb09eae8de0404ce3c5a6079c5e76b53
X-Git-Newrev: 33cc49849d6c9793f5c2c9bdbdcafad8d579bb7d
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.2FEAA85C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/ntp: add Upstream
 tag to patch 0001
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33cc49849d6c9793f5c2c9bdbdcafad8d579bb7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c72557eaf8b4fd4c1899e90c16323d7d52e0200b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                          | 1 -
 package/ntp/0001-ntp-syscalls-fallback.patch | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 99fd91f2b9..4893e9367d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -865,7 +865,6 @@ package/norm/0001-protolib-drop-linux-version-check.patch lib_patch.Upstream
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
