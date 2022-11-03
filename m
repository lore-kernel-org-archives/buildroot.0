Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA4CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0BA41898;
	Thu,  3 Nov 2022 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B0BA41898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAgE-TybMwDE; Thu,  3 Nov 2022 21:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6844188E;
	Thu,  3 Nov 2022 21:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA6844188E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58E3D1BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E87681FB7
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E87681FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4rdZCrF8n6t for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:05:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2C8181F86
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2C8181F86
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D015887C30; Thu,  3 Nov 2022 21:05:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:02:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ef116427cfeaaef3af9d0968246a0cfedfd9887a
X-Git-Newrev: 935edcfc311a9b76cc1d720b29985f89e686be3c
X-Patchwork-Hint: ignore
Message-Id: <20221103210546.D015887C30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-babel: bump to
 version 2.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=935edcfc311a9b76cc1d720b29985f89e686be3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to template update:
https://github.com/python-babel/babel/commit/8f5757cc85402a46c1db722f08c18cfa7f119858

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index 5211f20110..2b2f56d8c6 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5  7166099733d78aa857d74fa50d8ff58c  Babel-2.9.1.tar.gz
-sha256  bc0c176f9f6a994582230df350aa6e05ba2ebe4b3ac317eab29d9be5d2768da0  Babel-2.9.1.tar.gz
+md5  9ee7784fd452d456206ecd3a12694010  Babel-2.11.0.tar.gz
+sha256  5ef4b3226b0180dedded4229651c8b0e1a3a6a2837d45a073272f313e4cf97f6  Babel-2.11.0.tar.gz
 # Locally computed sha256 checksums
-sha256  28c97bf33e7506e277487bdaa3a69b70f170d6af5a82785ac0a74c8428042e40  LICENSE
+sha256  2499aec3c5f041c3ac2c448a15fb233314e4c20cbac1530be04ec31b2788631c  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index a503a139f9..8bc881e61c 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.9.1
+PYTHON_BABEL_VERSION = 2.11.0
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/17/e6/ec9aa6ac3d00c383a5731cc97ed7c619d3996232c977bb8326bcbb6c687e
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/ff/80/45b42203ecc32c8de281f52e3ec81cb5e4ef16127e9e8543089d8b1649fb
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
