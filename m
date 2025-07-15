Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6E6C83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B9DB415C0;
	Wed, 16 Jul 2025 18:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4_svoHiCElr; Wed, 16 Jul 2025 18:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A55F4159D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A55F4159D;
	Wed, 16 Jul 2025 18:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BE451514
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA61A40F32
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lrvnDr0Y_pq for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B1740F36
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B1740F36
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE7FF86662; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3c2256eb0191387525edee5066ecd49f09bacee
X-Git-Newrev: eca78cae6b3a121fb7bbc181aef746ab99c75821
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.CE7FF86662@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-gcr: bump to
 version 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=eca78cae6b3a121fb7bbc181aef746ab99c75821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 2.1.26, see:
https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index b2ad975851..469e8d6b17 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  126fdbf7351d2c7aaee6c525d9660738519eae53eeef77920b105fd4d1bc5dbd  docker-credential-gcr-v2.1.26-git4-go2.tar.gz
+sha256  a327753270232cb7f112b98328d5b56ae2da095ad74399b769aa5dad4393c8ae  docker-credential-gcr-v2.1.30-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index 658e9baf33..f889eb56c9 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.1.26
+DOCKER_CREDENTIAL_GCR_VERSION = v2.1.30
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
