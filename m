Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5EDC4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A2F281421;
	Sun, 13 Nov 2022 21:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A2F281421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOY57hXyJNCs; Sun, 13 Nov 2022 21:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F1781423;
	Sun, 13 Nov 2022 21:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F1781423
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC2F1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0750D81423
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0750D81423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8z82OilIGhx for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:51:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0FA81414
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F0FA81414
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A7D983828; Sun, 13 Nov 2022 21:51:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 22:51:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b5e209ed076f69fb0a8305b7a91e6d1b2bb73f76
X-Git-Newrev: b0b7fba64259140b9903a284b9b26a47a9a6315c
X-Patchwork-Hint: ignore
Message-Id: <20221113215129.2A7D983828@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-aiosignal: bump
 to version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0b7fba64259140b9903a284b9b26a47a9a6315c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiosignal/python-aiosignal.hash | 4 ++--
 package/python-aiosignal/python-aiosignal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiosignal/python-aiosignal.hash b/package/python-aiosignal/python-aiosignal.hash
index f2a09749b8..061816a66e 100644
--- a/package/python-aiosignal/python-aiosignal.hash
+++ b/package/python-aiosignal/python-aiosignal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiosignal/json
-md5  011700c3acc576a3a38deade6a4860cb  aiosignal-1.2.0.tar.gz
-sha256  78ed67db6c7b7ced4f98e495e572106d5c432a93e1ddd1bf475e1dc05f5b7df2  aiosignal-1.2.0.tar.gz
+md5  2a15f4008b899377590cef4773020902  aiosignal-1.3.1.tar.gz
+sha256  54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc  aiosignal-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-aiosignal/python-aiosignal.mk b/package/python-aiosignal/python-aiosignal.mk
index e0436e973e..ffd581cfba 100644
--- a/package/python-aiosignal/python-aiosignal.mk
+++ b/package/python-aiosignal/python-aiosignal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOSIGNAL_VERSION = 1.2.0
+PYTHON_AIOSIGNAL_VERSION = 1.3.1
 PYTHON_AIOSIGNAL_SOURCE = aiosignal-$(PYTHON_AIOSIGNAL_VERSION).tar.gz
-PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/27/6b/a89fbcfae70cf53f066ec22591938296889d3cc58fec1e1c393b10e8d71d
+PYTHON_AIOSIGNAL_SITE = https://files.pythonhosted.org/packages/ae/67/0952ed97a9793b4958e5736f6d2b346b414a2cd63e82d05940032f45b32f
 PYTHON_AIOSIGNAL_SETUP_TYPE = setuptools
 PYTHON_AIOSIGNAL_LICENSE = Apache-2.0
 PYTHON_AIOSIGNAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
