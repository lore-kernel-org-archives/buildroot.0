Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9C4E7B5F5
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 11:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6917C61418;
	Wed,  4 Oct 2023 11:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6917C61418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B5cZtmnUUV8h; Wed,  4 Oct 2023 11:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5F3561409;
	Wed,  4 Oct 2023 11:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5F3561409
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE061BF97D
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 11:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9A1341519
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 11:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A1341519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQGYV2u9oGQN for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 11:47:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18D3F40BFA
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 11:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D3F40BFA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05BAA841ED; Wed,  4 Oct 2023 11:47:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Oct 2023 13:45:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 657d10b34b1ba2fc3478a3cfad7ac7fcf4ce1094
X-Git-Newrev: 850efb92b56253cace2ba8bce94df0afe347037a
X-Patchwork-Hint: ignore
Message-Id: <20231004114740.05BAA841ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsndfile: bump to version 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=850efb92b56253cace2ba8bce94df0afe347037a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/libsndfile/libsndfile/releases/tag/1.2.1
https://github.com/libsndfile/libsndfile/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsndfile/libsndfile.hash | 2 +-
 package/libsndfile/libsndfile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsndfile/libsndfile.hash b/package/libsndfile/libsndfile.hash
index be3ba41dc6..94d6f96335 100644
--- a/package/libsndfile/libsndfile.hash
+++ b/package/libsndfile/libsndfile.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a  libsndfile-1.2.0.tar.xz
+sha256  3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e  libsndfile-1.2.2.tar.xz
 # Locally calculated
 sha256  ad01ea5cd2755f6048383c8d54c88459cd6fcb17757c5c8892f8c5ea060f6140  COPYING
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index d8d1725444..89eb4f3c1d 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSNDFILE_VERSION = 1.2.0
+LIBSNDFILE_VERSION = 1.2.2
 LIBSNDFILE_SOURCE = libsndfile-$(LIBSNDFILE_VERSION).tar.xz
 LIBSNDFILE_SITE = https://github.com/libsndfile/libsndfile/releases/download/$(LIBSNDFILE_VERSION)
 LIBSNDFILE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
