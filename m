Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B17CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D96614FC;
	Tue, 14 Oct 2025 20:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkdqrYqgXC_4; Tue, 14 Oct 2025 20:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0726147B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0726147B;
	Tue, 14 Oct 2025 20:29:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26307BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EF0D411DE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ncEX9iATU8f for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7525C411E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7525C411E3
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73AEC870FE; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 22:10:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 765b1c5dbec1a97d84159a8a4aaf8b1150abb49b
X-Git-Newrev: 1617498a20fdb5e194a8f0a454f391924738b690
X-Patchwork-Hint: ignore
Message-Id: <20251014202937.73AEC870FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mypy: bump version to 1.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1617498a20fdb5e194a8f0a454f391924738b690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-mypy/python-mypy.hash | 4 ++--
 package/python-mypy/python-mypy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
index ff49a92b18..9f1656ddce 100644
--- a/package/python-mypy/python-mypy.hash
+++ b/package/python-mypy/python-mypy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy/json
-md5  fb9ff268550456e6d100a21e02fc6574  mypy-1.18.1.tar.gz
-sha256  9e988c64ad3ac5987f43f5154f884747faf62141b7f842e87465b45299eea5a9  mypy-1.18.1.tar.gz
+md5  9ea329f0a99bb98554683680b988c5ea  mypy-1.18.2.tar.gz
+sha256  06a398102a5f203d7477b2923dda3634c36727fa5c237d8f859ef90c42a9924b  mypy-1.18.2.tar.gz
 # Locally computed sha256 checksums
 sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
index 6127975756..ba07ef5b9c 100644
--- a/package/python-mypy/python-mypy.mk
+++ b/package/python-mypy/python-mypy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MYPY_VERSION = 1.18.1
+PYTHON_MYPY_VERSION = 1.18.2
 PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
-PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/14/a3/931e09fc02d7ba96da65266884da4e4a8806adcdb8a57faaacc6edf1d538
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/c0/77/8f0d0001ffad290cef2f7f216f96c814866248a0b92a722365ed54648e7e
 PYTHON_MYPY_SETUP_TYPE = setuptools
 PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
 PYTHON_MYPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
