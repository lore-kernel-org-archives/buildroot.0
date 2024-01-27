Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C3C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0C1E60EFD;
	Sat, 27 Jan 2024 20:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0C1E60EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWWHATX_Iidv; Sat, 27 Jan 2024 20:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D0FE60EF1;
	Sat, 27 Jan 2024 20:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D0FE60EF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 965991BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE8E0834D3
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE8E0834D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXtvIIYvcR8C for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20BB78348C
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20BB78348C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D5E8866A8; Sat, 27 Jan 2024 20:56:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:48:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32f348f658aef08d3cde093b1fff8b9be6f2233
X-Git-Newrev: a1f94338856f04deca6db98426fa09209e00617f
X-Patchwork-Hint: ignore
Message-Id: <20240127205630.0D5E8866A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-plack: bump to version 1.0051
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f94338856f04deca6db98426fa09209e00617f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-plack/perl-plack.hash | 4 ++--
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index 84d65ec525..c9e2bb01f6 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0856a900a981769e3d79f0a10ccc3e65  Plack-1.0050.tar.gz
-sha256  d2651ade82ebbff7abe0a3a189fc932dadc4779186ce89468e56d0189eaa6ed4  Plack-1.0050.tar.gz
+md5  0b3e573458b37ad69069fc8cb307b6b8  Plack-1.0051.tar.gz
+sha256  bebde91c42298ed6ec8e6c82b21433a1b49aa39412c247f3905b80f955acf77b  Plack-1.0051.tar.gz
 
 # computed by scancpan
 sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index c39c3d8fd6..2c591cc05a 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0050
+PERL_PLACK_VERSION = 1.0051
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
