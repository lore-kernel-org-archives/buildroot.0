Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3279C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 577278142A;
	Sat,  6 May 2023 15:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 577278142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEzX6AA4Pzhg; Sat,  6 May 2023 15:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9430E81754;
	Sat,  6 May 2023 15:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9430E81754
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B295F1BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABA641EF5
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ABA641EF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f6kyZk9msiYA for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:34:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92A2441EDA
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92A2441EDA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FEE885E36; Sat,  6 May 2023 15:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 17:31:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1a5382182ea1a4d27dfed153a82050d3b53acce
X-Git-Newrev: 3d1ee7d624b71009ff61d4fa5ed860c52eb89b47
X-Patchwork-Hint: ignore
Message-Id: <20230506153442.7FEE885E36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatbuffers: bump version to 23.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d1ee7d624b71009ff61d4fa5ed860c52eb89b47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/google/flatbuffers/blob/master/CHANGELOG.md

Follow upstream rename of license file:
https://github.com/google/flatbuffers/commit/7fb785fd898a5379944457a399176235fc80d337

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flatbuffers/flatbuffers.hash | 4 ++--
 package/flatbuffers/flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 6382b86f1b..2ff56a8b76 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f97965a727d26386afaefff950badef2db3ab6af9afe23ed6d94bfb65f95f37e  flatbuffers-2.0.8.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  8aff985da30aaab37edf8e5b02fda33ed4cbdd962699a8e2af98fdef306f4e4d  flatbuffers-23.3.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 487d85ee1f..58c0414533 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 2.0.8
+FLATBUFFERS_VERSION = 23.3.3
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
-FLATBUFFERS_LICENSE_FILES = LICENSE.txt
+FLATBUFFERS_LICENSE_FILES = LICENSE
 FLATBUFFERS_CPE_ID_VENDOR = google
 FLATBUFFERS_INSTALL_STAGING = YES
 FLATBUFFERS_DEPENDENCIES = host-flatbuffers
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
