Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D715C83F1D
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E1E83B5A;
	Fri, 11 Jul 2025 10:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5oL1e3qhNPj; Fri, 11 Jul 2025 10:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F2EE83AE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F2EE83AE0;
	Fri, 11 Jul 2025 10:10:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D222968
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC2AE40C91
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_pi98vWiLgg for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 149364056D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 149364056D
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12BF1862CE; Fri, 11 Jul 2025 10:09:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:19:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 66236201abf291e27e0576aa4875b17044416279
X-Git-Newrev: 14b3716553bfd95e1b939644d4155af43f2c7947
X-Patchwork-Hint: ignore
Message-Id: <20250711100952.12BF1862CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-urllib3:
 bump to version 2.4.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8368296947235720426=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8368296947235720426==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=14b3716553bfd95e1b939644d4155af43f2c7947
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes: https://github.com/urllib3/urllib3/releases/tag/2.4.0

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dff7ead0453fc8f9f55067b48427c0ba88886310)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index f80ed6eafc..2391108e26 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  6388afd062cf2e1ef27843738629dbc1  urllib3-2.3.0.tar.gz
-sha256  f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d  urllib3-2.3.0.tar.gz
+md5  787104cdecd70e6688713f8a079ffd3f  urllib3-2.4.0.tar.gz
+sha256  414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466  urllib3-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 911ccab445..7294742909 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.3.0
+PYTHON_URLLIB3_VERSION = 2.4.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/aa/63/e53da845320b757bf29ef6a9062f5c669fe997973f966045cb019c3f4b66
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/8a/78/16493d9c386d8e60e442a35feac5e00f0913c0f4b7c217c11e8ec2ff53e0
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python

--===============8368296947235720426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8368296947235720426==--
