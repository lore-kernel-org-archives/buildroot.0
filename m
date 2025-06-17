Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14020C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D775D83B48;
	Tue, 17 Jun 2025 19:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qij5aXo7aCDM; Tue, 17 Jun 2025 19:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FCF483B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FCF483B47;
	Tue, 17 Jun 2025 19:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B1416B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE849404B0
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ap8P4ec03ZW for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4054C413D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4054C413D5
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30ABA83CFB; Tue, 17 Jun 2025 18:59:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 20:58:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49acad9f175443e0fa308a9208c321ae5fb007ae
X-Git-Newrev: 98cf601d0f2d4881c298e3f8c5fc2957e29ad369
X-Patchwork-Hint: ignore
Message-Id: <20250617185959.30ABA83CFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatbuffers: bump version to
 25.2.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98cf601d0f2d4881c298e3f8c5fc2957e29ad369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/google/flatbuffers/releases/tag/v25.2.10
https://github.com/google/flatbuffers/releases/tag/v25.1.24
https://github.com/google/flatbuffers/releases/tag/v25.1.21

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index be605f50ad..e7174e326e 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7e2ef35f1af9e2aa0c6a7d0a09298c2cb86caf3d4f58c0658b306256e5bcab10  flatbuffers-24.12.23.tar.gz
+sha256  b9c2df49707c57a48fc0923d52b8c73beb72d675f9d44b2211e4569be40a7421  flatbuffers-25.2.10.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index f526d57ab4..d49d01161d 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 24.12.23
+FLATBUFFERS_VERSION = 25.2.10
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
