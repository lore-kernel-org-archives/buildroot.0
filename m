Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D11EFC6182
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 141854029C;
	Fri, 13 Sep 2024 22:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYiTXtUsmxdz; Fri, 13 Sep 2024 22:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 781CB403D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 781CB403D6;
	Fri, 13 Sep 2024 22:17:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B94191BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 643CE4024D
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pokk3CBMpSps for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:17:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4598640263
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4598640263
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD10386FFD; Fri, 13 Sep 2024 22:17:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 00:17:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cb286c8a22980656673f0f3fa566fbaa57efd64
X-Git-Newrev: d07bb41a53fc3a9df4bdc9b9ebeff3b35289b555
X-Patchwork-Hint: ignore
Message-Id: <20240913221735.AD10386FFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump to version
 0.4.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=d07bb41a53fc3a9df4bdc9b9ebeff3b35289b555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

doc/LICENSE.rst hash changed due to additional details added:
https://github.com/chrysn/aiocoap/commit/cbd0d1feb74b0905b517f0e51d1eb258668bfeb0

Add additional license files as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiocoap/python-aiocoap.hash | 8 +++++---
 package/python-aiocoap/python-aiocoap.mk   | 8 ++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index c9d73cda26..33895b2387 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,5 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  baebbc38bc8db31472c438521f7121e3  aiocoap-0.4.7.tar.gz
-sha256  90f3bcaffd454f5421d3ad55ddbe3fe10a686d4b9f3c4445d427b130493a96a4  aiocoap-0.4.7.tar.gz
+md5  09a0cce4b192d861d2becf216f0769fc  aiocoap-0.4.11.tar.gz
+sha256  2603b8ec61caedf008b4a153a94f337262bf89f26d1c030f12c492d085e875f7  aiocoap-0.4.11.tar.gz
 # Locally computed sha256 checksums
-sha256  0ad39132b3529369998eb7493b950dc7452b07ba9d8cca7619766b6c6d8270fa  doc/LICENSE.rst
+sha256  c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  doc/LICENSE.rst
+sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 73a0d61eba..a69722232c 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.7
+PYTHON_AIOCOAP_VERSION = 0.4.11
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/de/14/843232b56c0f09b2ceddae3da37598d9109c4b1d9383b1ab72232018e9e8
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/50/b3/2ea6d3a294ec094da3175aceaa2ad1c2644eab162b48676267e992d4c651
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
-PYTHON_AIOCOAP_LICENSE = MIT
-PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst
+PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
+PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
