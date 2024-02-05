Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFDCC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B3E4098F;
	Mon,  5 Feb 2024 10:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21B3E4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkkdDQEAyvIJ; Mon,  5 Feb 2024 10:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3014031D;
	Mon,  5 Feb 2024 10:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3014031D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 670491BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 401384031D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 401384031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYYlWExu77Oa for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:04:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AE3240285
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AE3240285
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52003869DA; Mon,  5 Feb 2024 10:04:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:01:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6410ac6918add0070716dbcf61327457a676e4fa
X-Git-Newrev: a2d461d134d27a3c27abc0efd9c429e08b2beb26
X-Patchwork-Hint: ignore
Message-Id: <20240205100427.52003869DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpd2: bump to version 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2d461d134d27a3c27abc0efd9c429e08b2beb26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mpd2/python-mpd2.hash | 4 ++--
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index cfe5a7c0c0..0e5d9206a1 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  f083c107b28525bb4c2580140861d86e  python-mpd2-3.1.0.tar.gz
-sha256  f33c2cdb0d6baa74a36724f38c1c4a099a7ce2c8ec4a2bb7192150a5855df476  python-mpd2-3.1.0.tar.gz
+md5  b218d6f233c23da0bc82c372308bbf8d  python-mpd2-3.1.1.tar.gz
+sha256  4baec3584cc43ed9948d5559079fafc2679b06b2ade273e909b3582654b2b3f5  python-mpd2-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index 124ff57db0..2d2784e89d 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.1.0
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/59/32/e57725251ce3117d2ed2a7b76d9722ea9bea26f54b2cc8981d03350e4103
+PYTHON_MPD2_VERSION = 3.1.1
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/53/be/e77206eb35eb37ccd3506fba237e1431431d04c482707730ce2a6802e95c
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
