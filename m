Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468CDCCD1AF
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1446E80A50;
	Tue, 21 Oct 2025 20:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9r0R2CtXItl; Tue, 21 Oct 2025 20:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BB15810F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB15810F2;
	Tue, 21 Oct 2025 20:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09BC4277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBE6260BFF
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe9Y8CacVUhh for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F96260BF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F96260BF2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:13:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FB6A876FF; Tue, 21 Oct 2025 20:13:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 22:06:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 246f2eca20b26f0c35ffc7eee72edf690815608d
X-Git-Newrev: 6471977d83da9b49794d86753f9d321c48533bde
X-Patchwork-Hint: ignore
Message-Id: <20251021201314.2FB6A876FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xerces: bump to v3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6471977d83da9b49794d86753f9d321c48533bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes:
https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12355023&projectId=10510

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index 52c22ee826..871089346f 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.5.tar.gz.sha256
-sha256  545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5  xerces-c-3.2.5.tar.gz
+# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.3.0.tar.gz.sha256
+sha256  9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde  xerces-c-3.3.0.tar.gz
 
 # Hash for license file
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 7734cff0d2..198f15aa3a 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.5
+XERCES_VERSION = 3.3.0
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE = https://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
