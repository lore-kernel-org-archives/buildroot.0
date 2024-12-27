Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE922E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 14:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA7A560836;
	Fri, 27 Dec 2024 14:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8A2uTxL9SmsY; Fri, 27 Dec 2024 14:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B68C760837
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B68C760837;
	Fri, 27 Dec 2024 14:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9E0BF1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4E3960833
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pb76IFHsZJzZ for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 14:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90BD60832
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D90BD60832
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 14:31:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D05A58745F; Fri, 27 Dec 2024 14:31:24 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 13:53:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f05f2c1ad717b7cda065ee06fc1daa80cd09d859
X-Git-Newrev: a6de4cf11b44c11f35705b349979cd65b6906e73
X-Patchwork-Hint: ignore
Message-Id: <20241227143124.D05A58745F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiocoap: bump to version
 0.4.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6de4cf11b44c11f35705b349979cd65b6906e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiocoap/python-aiocoap.hash | 4 ++--
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 33895b2387..30e68a7582 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  09a0cce4b192d861d2becf216f0769fc  aiocoap-0.4.11.tar.gz
-sha256  2603b8ec61caedf008b4a153a94f337262bf89f26d1c030f12c492d085e875f7  aiocoap-0.4.11.tar.gz
+md5  a79e7c7586cbb9056743683eb9bbaef9  aiocoap-0.4.12.tar.gz
+sha256  808e87068aa57dbf31486cfdfa9098b0a6f5ca444c6b8966f3e50a403628981e  aiocoap-0.4.12.tar.gz
 # Locally computed sha256 checksums
 sha256  c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  doc/LICENSE.rst
 sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index a69722232c..357ac1da08 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.11
+PYTHON_AIOCOAP_VERSION = 0.4.12
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/50/b3/2ea6d3a294ec094da3175aceaa2ad1c2644eab162b48676267e992d4c651
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/a2/16/a9167225339089b2c295cc37aa5a01f758d164c5cda591cc9d2976719196
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
