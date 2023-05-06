Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C27CC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E630A81E03;
	Sat,  6 May 2023 15:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E630A81E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWqVJZcu7WAb; Sat,  6 May 2023 15:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0575F8142A;
	Sat,  6 May 2023 15:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0575F8142A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3841BF859
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53F94813FB
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F94813FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RIYPa8cEluJ for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85F63813CA
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F63813CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7225585E34; Sat,  6 May 2023 15:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 17:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd9278a6fc89dc2454ef7cc0b403b69c6e28c1b8
X-Git-Newrev: e1a5382182ea1a4d27dfed153a82050d3b53acce
X-Patchwork-Hint: ignore
Message-Id: <20230506153442.7225585E34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpd2: bump to version 3.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1a5382182ea1a4d27dfed153a82050d3b53acce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mpd2/python-mpd2.hash | 4 ++--
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index 88dcb28377..cfe5a7c0c0 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  594dff3e53c8eb6f583ba642bc2c1a27  python-mpd2-3.0.5.tar.gz
-sha256  6f1bffd93b9a32fc018a9bbf3487505b52e0d757ec34066905c60a912d492384  python-mpd2-3.0.5.tar.gz
+md5  f083c107b28525bb4c2580140861d86e  python-mpd2-3.1.0.tar.gz
+sha256  f33c2cdb0d6baa74a36724f38c1c4a099a7ce2c8ec4a2bb7192150a5855df476  python-mpd2-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index bfe382b59e..124ff57db0 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.0.5
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ed/c2/263621bdbbc37fa1a55fa1a7f66fd601bf08b3f87481e318a3509fb6c4bf
+PYTHON_MPD2_VERSION = 3.1.0
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/59/32/e57725251ce3117d2ed2a7b76d9722ea9bea26f54b2cc8981d03350e4103
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
