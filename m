Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA52EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:31:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79BFE61074
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79BFE61074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591BE607D8;
	Wed,  6 Oct 2021 19:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3z3U1FXb09-j; Wed,  6 Oct 2021 19:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B274E60F3A;
	Wed,  6 Oct 2021 19:31:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59CF21BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48F8960709
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqyuhcVTsQDF for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FEE660705
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1820393466; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54866ac074c705ced06624eebd068ae2afce5930
X-Git-Newrev: eade72275f81c5df36607b707b85a9907e2ec9f6
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.1820393466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvloop: make hash tabs
 double spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=eade72275f81c5df36607b707b85a9907e2ec9f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make hash tabs double spaces according to Buildroot .hash files style.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-uvloop/python-uvloop.hash | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index baed0b3e58..13bb3b7ee9 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5	c97447b8b386971be5e6f4328563be42  uvloop-0.15.0.tar.gz
-sha256	1a503d5b49da6e3dd5607d6e533a5315b1caedbf629901807c65a23a09cad065  uvloop-0.15.0.tar.gz
+md5  c97447b8b386971be5e6f4328563be42  uvloop-0.15.0.tar.gz
+sha256  1a503d5b49da6e3dd5607d6e533a5315b1caedbf629901807c65a23a09cad065  uvloop-0.15.0.tar.gz
 # Locally computed sha256 checksums
-sha256	2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
-sha256	9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
+sha256  2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
+sha256  9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
