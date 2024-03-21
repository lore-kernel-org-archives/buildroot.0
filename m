Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25817C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E22DB80BD8;
	Thu, 21 Mar 2024 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8klP_2u1rH6F; Thu, 21 Mar 2024 21:03:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8067980BFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8067980BFD;
	Thu, 21 Mar 2024 21:03:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F01E1BF980
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF7A1409C8
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dG7Z-BHlxQKC for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23127405C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23127405C2
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C176483760; Thu, 21 Mar 2024 21:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:59:46 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 4df20268fe2bd0514e9a78a948c16cae87a11587
X-Git-Newrev: a114ff1186d910aa392548ff49d53966bf037ecf
X-Patchwork-Hint: ignore
Message-Id: <20240321210221.C176483760@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/python-configshell-fb: bump version to 1.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=a114ff1186d910aa392548ff49d53966bf037ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

bump to latest version because previous version did not work with python 3.11

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0c27711002a82bbbb47363efceb526be7862bab3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-configshell-fb/python-configshell-fb.hash | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index 8fc38f61a6..e090501056 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  24b47284b463dcfb9ee0c1558827e13442127e62fa279b6e0253f136cf49058c  python-configshell-fb-1.1.29.tar.gz
+sha256  44696b92bea2b44c1d0bf2828477dddeb3b4dfb312ad82ce06d7b704c0985e27  python-configshell-fb-1.1.30.tar.gz
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index d0dd421e8d..3446a86e8d 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,7 +6,7 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = 1.1.29
+PYTHON_CONFIGSHELL_FB_VERSION = 1.1.30
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
