Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07164CCA470
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDBFE81422;
	Mon,  6 Oct 2025 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHkMSc7yqglf; Mon,  6 Oct 2025 21:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E243081332
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E243081332;
	Mon,  6 Oct 2025 21:09:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 96AD1226
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A44D41226
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2rZLsi2273v for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 21:09:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8310411DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8310411DA
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 21:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1356869D6; Mon,  6 Oct 2025 21:09:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 23:05:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa6edbb3e2006272cdbf8606978587113eb84151
X-Git-Newrev: 000398d6ac3ff57114b5bd30d29f8b784f53d78b
X-Patchwork-Hint: ignore
Message-Id: <20251006210951.B1356869D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-emailproxy: bump version to
 2025.10.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=000398d6ac3ff57114b5bd30d29f8b784f53d78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/simonrob/email-oauth2-proxy/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-emailproxy/python-emailproxy.hash | 4 ++--
 package/python-emailproxy/python-emailproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
index 3ba682e33b..6c534834ca 100644
--- a/package/python-emailproxy/python-emailproxy.hash
+++ b/package/python-emailproxy/python-emailproxy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/emailproxy/json
-md5  12c7de8acd36329613c994a9b20385a2  emailproxy-2025.6.25.tar.gz
-sha256  7737083d6339649ffb6149326f83258b537a580e9eb617e5d8343435eb55f261  emailproxy-2025.6.25.tar.gz
+md5  8cdcbe1f2e0956facf27cf2ed160e227  emailproxy-2025.10.4.tar.gz
+sha256  28efbc446df0319d9641b0b7a35440bae91863bf70471c8cedaafbefb1b50915  emailproxy-2025.10.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
index 01f0104e9a..603e58fe7c 100644
--- a/package/python-emailproxy/python-emailproxy.mk
+++ b/package/python-emailproxy/python-emailproxy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EMAILPROXY_VERSION = 2025.6.25
+PYTHON_EMAILPROXY_VERSION = 2025.10.4
 PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
-PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/a4/85/c9266b2457f018783dc0149e123bad115e02d0bd01f7c2a5aa61715250f1
+PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/4f/0d/045028f891c4a83ea7d616a81f0b9af8d290316eb0c958d572b6445232f9
 PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
 PYTHON_EMAILPROXY_LICENSE = Apache-2.0
 PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
