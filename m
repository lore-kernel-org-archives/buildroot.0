Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B760BC02187
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A5784C99;
	Sat, 18 Jan 2025 11:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7LwVhUIcFj9; Sat, 18 Jan 2025 11:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF8884C71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF8884C71;
	Sat, 18 Jan 2025 11:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA1F269
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B369A40128
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0wWyRkcDDWA for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A688440290
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A688440290
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90E5885D09; Sat, 18 Jan 2025 11:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 12:49:50 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 32a5fc983084282d8e7275aec80ddcee192f35fb
X-Git-Newrev: 5e078a644a4f68819525c436e20b5bcbfb79aba9
X-Patchwork-Hint: ignore
Message-Id: <20250118115358.90E5885D09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/pipewire: bump
 version to 1.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e078a644a4f68819525c436e20b5bcbfb79aba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Includes various bugfixes. For details, see NEWS:
https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/cc7439187f61dd73b81ca69f5dbccbb52ce970b2/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b94d0d354df0baec54af5ec52556d542849d6315)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.hash | 2 +-
 package/pipewire/pipewire.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 8ea3890675..9ffe95cbea 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b3817f7b9abf14a6dbcb6ea18b186ba8771f703cb395e4a38366b4e051c40054  pipewire-1.2.2.tar.bz2
+sha256  3c00292f9a419610c9eeb6e45b958d460afb601ecc6894012574a3b9f118616a  pipewire-1.2.7.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index eb86a98494..9ad92546cc 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 1.2.2
+PIPEWIRE_VERSION = 1.2.7
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
