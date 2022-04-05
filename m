Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C02FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 19:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D66560EA5;
	Tue,  5 Apr 2022 19:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJwQ0yFjI0cE; Tue,  5 Apr 2022 19:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9AF60BB0;
	Tue,  5 Apr 2022 19:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 044E31BF21A
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6587409FA
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 19:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gH1TIHSRbIGx for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 19:51:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C429405E8
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 19:51:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5E1A88362C; Tue,  5 Apr 2022 19:41:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Apr 2022 21:50:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d76f1433721b813661d1f3fb916590f8fd404b3b
X-Git-Newrev: b82afb7f10d8561efa5651f452acf79824efc3fb
X-Patchwork-Hint: ignore
Message-Id: <20220405194155.5E1A88362C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/fluidsynth: bump
 to version 2.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=b82afb7f10d8561efa5651f452acf79824efc3fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

For change log since v2.2.5, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.6

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d2fc098faa5b8b8608b4c3d56dc526374c3319aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 0d41c16d8d..20eb9ec49f 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9037e703617f91c4c36039a5059e0f624164799d856af715bcd8a23c07ba03b8  fluidsynth-2.2.5.tar.gz
+sha256  ca90fe675cacd9a7b442662783c4e7fa0e1fd638b28d64105a4e3fe0f618d20f  fluidsynth-2.2.6.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index b500944c16..d7c72ed059 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.5
+FLUIDSYNTH_VERSION = 2.2.6
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
