Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D94C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D86CF40101;
	Tue, 26 Jul 2022 20:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D86CF40101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Prp2mSF4WDcV; Tue, 26 Jul 2022 20:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF07A400D8;
	Tue, 26 Jul 2022 20:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF07A400D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23D631BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C8768175A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C8768175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E83sM_MqBEW1 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:08:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24F8581757
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F8581757
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A468E85FB0; Tue, 26 Jul 2022 19:54:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 22:04:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 042399b93c6a7a71542922be1f131899af34d98c
X-Git-Newrev: 0e017b4c7bf6e786fffac3cec6d750bc7a556084
X-Patchwork-Hint: ignore
Message-Id: <20220726195425.A468E85FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bird: bump to 2.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e017b4c7bf6e786fffac3cec6d750bc7a556084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While we're at it, update URL to https instead of ftp.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 2d20491dd6..6ccacd8d58 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256  19d2de83ee25a307b9e5b9e58797dd68766d439bcee33e3ac617ed502370e7f6  bird-2.0.8.tar.gz
+sha256  7ed341ddd8dc87fa9736586b3515447a8436fec442d65f4022155ab9de1ffd5a  bird-2.0.10.tar.gz
 sha256  94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index b77e1aba19..e1e392168c 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.8
-BIRD_SITE = ftp://bird.network.cz/pub/bird
+BIRD_VERSION = 2.0.10
+BIRD_SITE = https://bird.network.cz/download
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
 BIRD_CPE_ID_VENDOR = nic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
