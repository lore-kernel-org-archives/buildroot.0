Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE29C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF69E4F04F;
	Fri, 28 Feb 2025 16:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jau_joeKtkuG; Fri, 28 Feb 2025 16:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACE674F7B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE674F7B6;
	Fri, 28 Feb 2025 16:41:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1620F94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97D3D42650
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cn1Kuo_b9R1E for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F993424EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F993424EC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A19385E77; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Dec 2024 00:33:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 83850d1cdd6bd190fdf81b1688973fc242d6c324
X-Git-Newrev: a0ebdd5cd8318d03693ffa2bfd95b311847bbc1c
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.5A19385E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cloudflared: bump to
 version 2024.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0ebdd5cd8318d03693ffa2bfd95b311847bbc1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://github.com/cloudflare/cloudflared/blob/2024.12.2/RELEASE_NOTES

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index e924d12481..3d02b78b6f 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f96b703ea848bc538322eb957749b0b2395e0cf83213cf310cbde0a3f598eac4  cloudflared-2024.9.1-go2.tar.gz
+sha256  48b9c54d79419d0489baadb8cb54d5196e0ff17650fb9eff81de02989fa8b009  cloudflared-2024.12.2-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 68849e9b82..78b46f9d0e 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2024.9.1
+CLOUDFLARED_VERSION = 2024.12.2
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
