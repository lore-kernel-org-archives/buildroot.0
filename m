Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E836C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAFF060F9E
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAFF060F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEDF780DCE;
	Sun, 26 Sep 2021 19:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NvAxrYJWPlW; Sun, 26 Sep 2021 19:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AE2B80D9D;
	Sun, 26 Sep 2021 19:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9731BF97A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76D5E40109
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhXXEltbRJ8O for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08C9040198
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9FCCC8D25B; Sun, 26 Sep 2021 19:50:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 21:08:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba48432cfd288ae9ca4344a31d275f25d6d2ff6d
X-Git-Newrev: e13279478a6269440e3420026ac53adeb97874da
X-Patchwork-Hint: ignore
Message-Id: <20210926195017.9FCCC8D25B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-rtmp: bump
 version to 19.0.0-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=e13279478a6269440e3420026ac53adeb97874da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index e645fb14bb..814decad3e 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  efaaa9b07c18810582a3826df476fc36a2aac82be7512271545073c3f6cc0212  kodi-inputstream-rtmp-3.4.0-Matrix.tar.gz
+sha256  0e97aaeae7e1aaa16d97996651dcab45aeb6937dc5bf177529c5ad8aa2014b0e  kodi-inputstream-rtmp-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 6029b7d35c..74d987f6fe 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = 3.4.0-Matrix
+KODI_INPUTSTREAM_RTMP_VERSION = 19.0.0-Matrix
 KODI_INPUTSTREAM_RTMP_SITE = $(call github,xbmc,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
