Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79694CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 20:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441FC61370;
	Tue, 14 Oct 2025 20:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGPjpB8nXnUW; Tue, 14 Oct 2025 20:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E247061340
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E247061340;
	Tue, 14 Oct 2025 20:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E6BA1C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21CE94051F
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJdydewATS86 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 20:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF417401C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF417401C2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 20:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF187870FD; Tue, 14 Oct 2025 20:29:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 22:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1888e39153bea005f2b1ec6b23649e87ce8269c
X-Git-Newrev: 9b911805207b425b444954ba2f3f9d0e1c39246d
X-Patchwork-Hint: ignore
Message-Id: <20251014202936.DF187870FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flatbuffers: bump version
 to 25.9.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b911805207b425b444954ba2f3f9d0e1c39246d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flatbuffers/python-flatbuffers.hash | 4 ++--
 package/python-flatbuffers/python-flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flatbuffers/python-flatbuffers.hash b/package/python-flatbuffers/python-flatbuffers.hash
index ccc754f9be..1d046fb3f4 100644
--- a/package/python-flatbuffers/python-flatbuffers.hash
+++ b/package/python-flatbuffers/python-flatbuffers.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flatbuffers/json
-md5  3391732d344155cc070892fae5f7166c  flatbuffers-2.0.7.tar.gz
-sha256  0ae7d69c5b82bf41962ca5fde9cc43033bc9501311d975fd5a25e8a7d29c1245  flatbuffers-2.0.7.tar.gz
+md5  a0f1d5a1ae9f0a99b38c15041f2e1739  flatbuffers-25.9.23.tar.gz
+sha256  676f9fa62750bb50cf531b42a0a2a118ad8f7f797a511eda12881c016f093b12  flatbuffers-25.9.23.tar.gz
diff --git a/package/python-flatbuffers/python-flatbuffers.mk b/package/python-flatbuffers/python-flatbuffers.mk
index 65f3d0955c..8b9c06df52 100644
--- a/package/python-flatbuffers/python-flatbuffers.mk
+++ b/package/python-flatbuffers/python-flatbuffers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLATBUFFERS_VERSION = 2.0.7
+PYTHON_FLATBUFFERS_VERSION = 25.9.23
 PYTHON_FLATBUFFERS_SOURCE = flatbuffers-$(PYTHON_FLATBUFFERS_VERSION).tar.gz
-PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/d1/90/0532e737a11e1dc50e9e352c3ccc97338cb75991f83279c2edbc9234e022
+PYTHON_FLATBUFFERS_SITE = https://files.pythonhosted.org/packages/9d/1f/3ee70b0a55137442038f2a33469cc5fddd7e0ad2abf83d7497c18a2b6923
 PYTHON_FLATBUFFERS_LICENSE = Apache-2.0
 PYTHON_FLATBUFFERS_SETUP_TYPE = setuptools
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
