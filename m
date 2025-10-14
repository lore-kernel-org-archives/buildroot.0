Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CD3CCD195
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E757F612E5;
	Tue, 14 Oct 2025 20:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46o1UMr9I5Dn; Tue, 14 Oct 2025 20:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC9B860F23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9B860F23;
	Tue, 14 Oct 2025 20:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18BF51C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9B67813EC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF3dLiw2A4aS for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27BD4813FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27BD4813FD
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26512870FE; Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 22:10:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4e257ff24be62b7d2568b420a40a74fd11f3653
X-Git-Newrev: d3523439f2a230759c4ecdf8c2819e7c7fda83e3
X-Patchwork-Hint: ignore
Message-Id: <20251014202937.26512870FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hid: bump version to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3523439f2a230759c4ecdf8c2819e7c7fda83e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hid/python-hid.hash | 4 ++--
 package/python-hid/python-hid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hid/python-hid.hash b/package/python-hid/python-hid.hash
index d03757771b..b990a2a9f8 100644
--- a/package/python-hid/python-hid.hash
+++ b/package/python-hid/python-hid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hid/json
-md5  1954df0dce4e15afd89197e898039e92  hid-1.0.6.tar.gz
-sha256  48d764d7ae9746ba123b96dbf457893ca80268b7791c4b1d2e051310eeb83860  hid-1.0.6.tar.gz
+md5  231df641df11d452dae6b579ba2ccf6a  hid-1.0.8.tar.gz
+sha256  5ca129a7b9434ace5e3e429c1092a16792feffaf067a46b666e9c586872cdcfe  hid-1.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  5524b425acacdfedeca3f959980f0cd38b00176ebbb292e4a96c520d6074353d  LICENSE
diff --git a/package/python-hid/python-hid.mk b/package/python-hid/python-hid.mk
index 2f65bd1412..1e422dc97b 100644
--- a/package/python-hid/python-hid.mk
+++ b/package/python-hid/python-hid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HID_VERSION = 1.0.6
+PYTHON_HID_VERSION = 1.0.8
 PYTHON_HID_SOURCE = hid-$(PYTHON_HID_VERSION).tar.gz
-PYTHON_HID_SITE = https://files.pythonhosted.org/packages/50/b8/5f470948262b6cdda8e1b2382b19f67c57eacda1e07a14322807b911e0ce
+PYTHON_HID_SITE = https://files.pythonhosted.org/packages/29/42/9cd3eab530ffae5e0ff880c575fd18cfdfe292b71f1e9872c392329f35fd
 PYTHON_HID_SETUP_TYPE = setuptools
 PYTHON_HID_LICENSE = MIT
 PYTHON_HID_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
