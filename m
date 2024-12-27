Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E364C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BFA4FB4E;
	Fri, 28 Feb 2025 16:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQje2AGvMEoq; Fri, 28 Feb 2025 16:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1DCA4FB65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1DCA4FB65;
	Fri, 28 Feb 2025 16:45:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19AB81DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52C2442D29
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NqcWqm0t-dj for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE1E42547
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE1E42547
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 782F887C1E; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 14:24:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f68cac12c1f6751037cfed7ee9c887b167b5a4dc
X-Git-Newrev: 72fb4e89a913d17754143132c24dd0859466fb97
X-Patchwork-Hint: ignore
Message-Id: <20250228162948.782F887C1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-google-auth:
 bump to version 2.37.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=72fb4e89a913d17754143132c24dd0859466fb97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index ef0ceaeb60..d71c3e36f3 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  8dba1c171af4d945fb479ab27a0aac38  google_auth-2.36.0.tar.gz
-sha256  545e9618f2df0bcbb7dcbc45a546485b1212624716975a1ea5ae8149ce769ab1  google_auth-2.36.0.tar.gz
+md5  db93ac3219d6a9b7ecc34f46637349e9  google_auth-2.37.0.tar.gz
+sha256  0054623abf1f9c83492c63d3f47e77f0a544caa3d40b2d98e099a611c2dd5d00  google_auth-2.37.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index f2ccc2e3de..5925820995 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.36.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.37.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/6a/71/4c5387d8a3e46e3526a8190ae396659484377a73b33030614dd3b28e7ded
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/46/af/b25763b9d35dfc2c6f9c3ec34d8d3f1ba760af3a7b7e8d5c5f0579522c45
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
