Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5CCC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:39:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B5EC606A5
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B5EC606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 517D582FD5;
	Tue, 20 Jul 2021 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1t0jkMTZ-QV3; Tue, 20 Jul 2021 21:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D4482F37;
	Tue, 20 Jul 2021 21:39:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D927E1BF3E9
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5DCA402D3
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAkSEiYsjOB6 for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44649402BC
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:38:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D37E787753; Tue, 20 Jul 2021 21:04:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:30:49 +0200
Subject: [git commit] DEVELOPERS: update email address for Raphaël Mélotte
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4bb10b45a20cb183980f5d7cc8b93fd35c498d9
X-Git-Newrev: fade40dfc36a2ca604f12add79013b047eae59fe
X-Patchwork-Hint: ignore
Message-ID: <20210720210408.D37E787753@busybox.osuosl.org>
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7706960860614957699=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720213049.nsQLjqx9-jobp80bZYDff371Tq17kj69QQwvjvxWSg8@z>

--===============7706960860614957699==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fade40dfc36a2ca604f12add79013b047eae59fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 65ab98351e..1e1a30bac9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2254,7 +2254,7 @@ F:	package/nanomsg/
 N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
-N:	Raphaël Mélotte <raphael.melotte@essensium.com>
+N:	Raphaël Mélotte <raphael.melotte@mind.be>
 F:	package/jbig2dec/
 F:	package/mupdf/
 F:	package/python-boto3/

--===============7706960860614957699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============7706960860614957699==--
