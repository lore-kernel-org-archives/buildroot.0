Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D67C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 21:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A665D83367;
	Sun, 20 Jul 2025 21:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QypfT28KbekM; Sun, 20 Jul 2025 21:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5908833A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5908833A7;
	Sun, 20 Jul 2025 21:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 108621F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FDDB81FA0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJnw25cBmUEY for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C94A82F84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C94A82F84
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29A15868B5; Sun, 20 Jul 2025 21:30:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 22:53:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee2d58751e2c7af1e1f5a012f3ee7ee33032680d
X-Git-Newrev: f5b13a148f160e2a329e4c16cd5cb67d8051ea9c
X-Patchwork-Hint: ignore
Message-Id: <20250720213008.29A15868B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump to version
 0.4.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5b13a148f160e2a329e4c16cd5cb67d8051ea9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to adding SPDX header:
https://github.com/chrysn/aiocoap/commit/e666dd6515479f44fda6b5610064025ada56e199

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiocoap/python-aiocoap.hash | 6 +++---
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 30e68a7582..dfe0d02c80 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  a79e7c7586cbb9056743683eb9bbaef9  aiocoap-0.4.12.tar.gz
-sha256  808e87068aa57dbf31486cfdfa9098b0a6f5ca444c6b8966f3e50a403628981e  aiocoap-0.4.12.tar.gz
+md5  028b0ce02cb94317a24d31adbb22150c  aiocoap-0.4.14.tar.gz
+sha256  01a34233b6f9a97df9a61f30bc64c0399bac498eaa160189a7f1f48f89d18717  aiocoap-0.4.14.tar.gz
 # Locally computed sha256 checksums
-sha256  c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  doc/LICENSE.rst
+sha256  8baefb820ca33d8176df8d0430ce05d15764617cd07ec04238c56d641273f472  doc/LICENSE.rst
 sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 357ac1da08..26909e7dd1 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.12
+PYTHON_AIOCOAP_VERSION = 0.4.14
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/a2/16/a9167225339089b2c295cc37aa5a01f758d164c5cda591cc9d2976719196
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/28/76/de52f7fa51ddbb5255f7b80d8965903bfa718420ac5d21b0852f5d81c1b1
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
