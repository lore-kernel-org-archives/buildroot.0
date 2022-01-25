Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FEDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E162815CC;
	Tue, 25 Jan 2022 18:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQlDpxPfXzET; Tue, 25 Jan 2022 18:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0178813CF;
	Tue, 25 Jan 2022 18:18:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2C71BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 299AD813CD
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkoUYFDPvObB for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:18:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A4F2813C9
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:18:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A0632822FF; Tue, 25 Jan 2022 18:12:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 19:17:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 206ce351619e401cc7d7e53f1baad7b20d3d2da5
X-Git-Newrev: be89d78a0f0731b387a0a0bd00e8118c6728fa72
X-Patchwork-Hint: ignore
Message-Id: <20220125181205.A0632822FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mpd2: bump to version 3.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=be89d78a0f0731b387a0a0bd00e8118c6728fa72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-mpd2/python-mpd2.hash | 4 ++--
 package/python-mpd2/python-mpd2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
index 83487257ee..88dcb28377 100644
--- a/package/python-mpd2/python-mpd2.hash
+++ b/package/python-mpd2/python-mpd2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
-md5  e31c6063e9c2e029a26b0815cd08b05e  python-mpd2-3.0.4.tar.gz
-sha256  7a67834e22d97e7cd77f8951c8baf87c149285c67d67d73550ce034302561ae5  python-mpd2-3.0.4.tar.gz
+md5  594dff3e53c8eb6f583ba642bc2c1a27  python-mpd2-3.0.5.tar.gz
+sha256  6f1bffd93b9a32fc018a9bbf3487505b52e0d757ec34066905c60a912d492384  python-mpd2-3.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
index f357e302fd..bfe382b59e 100644
--- a/package/python-mpd2/python-mpd2.mk
+++ b/package/python-mpd2/python-mpd2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_MPD2_VERSION = 3.0.4
-PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ad/92/bec26455a3a6d6146bcf2a974f5c3509d451306413b386fc12b037d9e3b0
+PYTHON_MPD2_VERSION = 3.0.5
+PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ed/c2/263621bdbbc37fa1a55fa1a7f66fd601bf08b3f87481e318a3509fb6c4bf
 PYTHON_MPD2_SETUP_TYPE = setuptools
 PYTHON_MPD2_LICENSE = LGPL-3.0+
 PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
