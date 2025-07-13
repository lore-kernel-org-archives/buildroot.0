Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37077C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 13:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D44400C9;
	Sun, 13 Jul 2025 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0EXIr3Epiiv; Sun, 13 Jul 2025 13:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C944040986
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C944040986;
	Sun, 13 Jul 2025 13:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44B105E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 368D740112
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoigiboGRIch for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 13:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47FBE40018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47FBE40018
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 13:44:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 366DF86499; Sun, 13 Jul 2025 13:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Jul 2025 15:32:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec477e79661235e6da30ee5c6fcb3970a0b5b789
X-Git-Newrev: d79bbd48eb523ee1c3daa82728519fe7878611e4
X-Patchwork-Hint: ignore
Message-Id: <20250713134449.366DF86499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d79bbd48eb523ee1c3daa82728519fe7878611e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/luarocks/luarocks/blob/v3.12.2/CHANGELOG.md

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 02474d0364..9c69e31dd9 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3d4c8acddf9b975e77da68cbf748d5baf483d0b6e9d703a844882db25dd61cdf  luarocks-3.12.0.tar.gz
+sha256  b0e0c85205841ddd7be485f53d6125766d18a81d226588d2366931e9a1484492  luarocks-3.12.2.tar.gz
 sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 37d48a9474..43d099726f 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.12.0
+LUAROCKS_VERSION = 3.12.2
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
