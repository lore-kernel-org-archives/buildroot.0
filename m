Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CFED3A696
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA68980AA7;
	Tue, 29 Oct 2024 20:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMYB0jf6cyXo; Tue, 29 Oct 2024 20:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55B3180A98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B3180A98;
	Tue, 29 Oct 2024 20:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 035655E4F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E622B4003A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_jClIztB3Kf for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC5240029
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC5240029
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:26:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D794C847F3; Tue, 29 Oct 2024 20:26:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 21:25:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a198f7910d926b2654f243fa3781c933be4cabf
X-Git-Newrev: d4a710b3b12ed31ef599ab2328e4e234b5900e66
X-Patchwork-Hint: ignore
Message-Id: <20241029202620.D794C847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-ares: bump to 1.34.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d4a710b3b12ed31ef599ab2328e4e234b5900e66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to [1].

[1] https://github.com/c-ares/c-ares/commit/595cf2133488d2e02c6389577a1b511971dba1ba

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/c-ares/c-ares.hash | 4 ++--
 package/c-ares/c-ares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index e1cf9f657a..8dc84ada89 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061  c-ares-1.32.2.tar.gz
+sha256  35410aa625cc9ee95b66475f54aea7c81c673fb63d75fad5eee267711503b72a  c-ares-1.34.2.tar.gz
 
 # Hash for license file
-sha256  8a9994f85a8e531e1a3217ab7ba509787c6b93056aabe702137ce662db8321c2  LICENSE.md
+sha256  460f5e768fda3752ca2169a95df062578a10fb126bfd65f3b9b1a1bed2f84807  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 4b7342cadb..6685ade9d6 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.32.2
-C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.32.2
+C_ARES_VERSION = 1.34.2
+C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/v1.34.2
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
