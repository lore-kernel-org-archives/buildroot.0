Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F2D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE0D041525;
	Thu, 10 Oct 2024 21:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21VTYOxRQWFp; Thu, 10 Oct 2024 21:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64DAB413FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64DAB413FC;
	Thu, 10 Oct 2024 21:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 191901BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71F6E410E4
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8MuQuRtpbAk for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A3A412E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A3A412E1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3531E84553; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:18:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 949eec50e1cda1853ef34dadd00d92d9ebe0a163
X-Git-Newrev: 6aca5f921bd5202d525243765259688e4e0c1fb8
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.3531E84553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scapy: bump to version 2.6.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6aca5f921bd5202d525243765259688e4e0c1fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-scapy/python-scapy.hash | 4 ++--
 package/python-scapy/python-scapy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scapy/python-scapy.hash b/package/python-scapy/python-scapy.hash
index 7b21e6cb30..3ab7eb9386 100644
--- a/package/python-scapy/python-scapy.hash
+++ b/package/python-scapy/python-scapy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/scapy/json
-md5  f546b1c82c2c98e0dae1a436219dd042  scapy-2.5.0.tar.gz
-sha256  5b260c2b754fd8d409ba83ee7aee294ecdbb2c235f9f78fe90bc11cb6e5debc2  scapy-2.5.0.tar.gz
+md5  0fb44b6db8fbb76c0648c9c161067c15  scapy-2.6.0.tar.gz
+sha256  c8f7eb54511c2fab502128ccf18e2e4b98e1f6af6e02ae15b84ad3039143ba3b  scapy-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/python-scapy/python-scapy.mk b/package/python-scapy/python-scapy.mk
index a2c6cc6872..8c3cae3348 100644
--- a/package/python-scapy/python-scapy.mk
+++ b/package/python-scapy/python-scapy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCAPY_VERSION = 2.5.0
+PYTHON_SCAPY_VERSION = 2.6.0
 PYTHON_SCAPY_SOURCE = scapy-$(PYTHON_SCAPY_VERSION).tar.gz
-PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/67/a1/2a60d5b6f0fed297dd0c0311c887d5e8a30ba1250506585b897e5a662f4c
+PYTHON_SCAPY_SITE = https://files.pythonhosted.org/packages/70/ca/17cc6ee0dbf342193732312f14bfc879dd162570287fd9f65ac1eb8a9c5f
 PYTHON_SCAPY_SETUP_TYPE = setuptools
 PYTHON_SCAPY_LICENSE = GPL-2.0
 PYTHON_SCAPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
