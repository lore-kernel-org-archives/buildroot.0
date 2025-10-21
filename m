Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AC2CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174F482662;
	Tue, 21 Oct 2025 20:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVNkRZYtH3Cl; Tue, 21 Oct 2025 20:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A8582695
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A8582695;
	Tue, 21 Oct 2025 20:38:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C55170A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DB9040471
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTy4egP76Rp4 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09C4A40468
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09C4A40468
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:38:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECCBC87707; Tue, 21 Oct 2025 20:38:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 22:25:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6471977d83da9b49794d86753f9d321c48533bde
X-Git-Newrev: 926e0504d06b5d61d7affb24b94b133b916b71f7
X-Patchwork-Hint: ignore
Message-Id: <20251021203812.ECCBC87707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to 257.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=926e0504d06b5d61d7affb24b94b133b916b71f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/systemd/systemd/compare/v257.7...v257.10

This commit updates the license hashes. See:
https://github.com/systemd/systemd/commit/603034cc42aa059fb2c8adb80ad60f68b349033f

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: fix license hashes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/systemd/systemd.hash | 10 +++++-----
 package/systemd/systemd.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 7f8bc837a9..d68950f934 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,16 +1,16 @@
 # sha256 locally computed
-sha256  70ecf759260549486045d065555d2f8a0ac0b8523d8f58227559fbd6d7523b08  systemd-257.7.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
+sha256  5a2f477e6268630f6e2829c7bb3e442017549798a4122635817934eaa0c6ac10  systemd-257.10.tar.gz
+sha256  ac4985facb553559981f507982444d779115e3e3a4c8b7847ae956198490c1b3  LICENSE.GPL2
+sha256  6d9bb3b7fc818a8facc4cc296060a0883fef8710d6498f86165335846e82ee9d  LICENSE.LGPL2.1
 sha256  c9e7bf5b7c243c719b8b43c36158effb9b54c5e80abc9d82e4b2d4b2a4aa64ad  LICENSES/alg-sha1-public-domain.txt
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  LICENSES/BSD-3-Clause.txt
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
-sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
+sha256  c7e6735d511987e7ed4c4a08b335d578335088e06225955ec8944973dbc0640c  LICENSES/LGPL-2.0-or-later.txt
 sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
 sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
 sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENSES/MIT-0.txt
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  8f3141489df84100440efa9911603e83757ff97f26f737e1d7fa2b25207a7905  LICENSES/README.md
+sha256  768ecb25cb1e6e41672fc655571f45ba46a3f03fcbc6ab56c7a09ac5928eb37b  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 4d15996662..6d04ee2581 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 257.7
+SYSTEMD_VERSION = 257.10
 SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
