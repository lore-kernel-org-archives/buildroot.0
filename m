Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBAFCCD185
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC37A60690;
	Fri, 10 Oct 2025 17:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dT6fEkHQ0t63; Fri, 10 Oct 2025 17:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9346068C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9346068C;
	Fri, 10 Oct 2025 17:42:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C55414B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52E3E40787
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgOEK5UNv4HR for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D28140791
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D28140791
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D02E87036; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 19:22:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f37af5d8fc8ad5303af71265344bdb2c6cdba91c
X-Git-Newrev: cee45f6ceec38a2c57c9a24423182e1e036febf4
X-Patchwork-Hint: ignore
Message-Id: <20251010174246.8D02E87036@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to version
 2025-09-26
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

commit: https://git.buildroot.net/buildroot/commit/?id=cee45f6ceec38a2c57c9a24423182e1e036febf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.17.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add new line at end of hash file to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 1e1691e535..d5bd34ac1e 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8209950e00716c4731675bbf5ee6ee8d54b010e70f86245c70d5c85fddee5694  rtl8189fs-d0f15f392570499f3e48f6d157c89cadf393a739.tar.gz
+sha256  4d8495b1b5a0c42ff0df775b16abd38103ad8532c53c0527f416484f8c2d477f  rtl8189fs-876e627a5b6a8021700391b4249a4a31edfebe5c.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index abd159f22f..45ad24e392 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = d0f15f392570499f3e48f6d157c89cadf393a739
+RTL8189FS_VERSION = 876e627a5b6a8021700391b4249a4a31edfebe5c
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
