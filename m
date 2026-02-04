Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED3EE9D40F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5684C6079A;
	Wed,  4 Feb 2026 17:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyJ53narFV9e; Wed,  4 Feb 2026 17:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F762610B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770227129;
	bh=jbyD6DI975DcBO04xffpdYCBQtS7Dk26e7sGGNrr1o4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=On2ZrSVzY3gTh9lpTFbYmRDK6NQEByWyRsIvUlHm8LieCafZCK7fd5N46aIyi2+pY
	 hODN0RUMjwtv5II5SPllg7MsKdCOdIex0j4g0y9EodfW4RIcWNiZP/DjF9cKLo1FRf
	 Y5OYKFVXPnQvfFHBti/5nnlYxStBXFMkfPN3HcOLuiHA71LSrDtpZIth33wJT0oMhq
	 EdFHqOwK7nnlgwDSikTI1qdCOi/793kwcqc3oHAAHGx8EGanxWwRLfcOpujEIgHE6Y
	 v9OSsIrGWCwRHL7H8ia1Ig5xzKelcLYTTqs3fy5D1SXzuDTv7a12Qf7/S7ifrutvyu
	 I7DyGEU7BujIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F762610B3;
	Wed,  4 Feb 2026 17:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D5AE17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74EA280F6E
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs7ebHbo4-Il for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9014780EC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9014780EC5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:44:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65E5086995; Wed,  4 Feb 2026 17:42:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 18:40:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba48197d1fe5d6a67c3138377851c43482b5698c
X-Git-Newrev: 6fed872e083c5d5d490977b2bffbd68ebd141f1b
X-Patchwork-Hint: ignore
Message-Id: <20260204174209.65E5086995@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: update release hashes
 comment
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4779918313984307777=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4779918313984307777==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fed872e083c5d5d490977b2bffbd68ebd141f1b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The old URL now leads to an HTTP 404 not found error.
Update it to the new one which contains the hashes for the current
release as well as older ones.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mupdf/mupdf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 580235eeca..80de6f3b2c 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,4 +1,4 @@
-# From https://mupdf.com/downloads/index.html:
+# From https://mupdf.com/releases:
 sha1  d79600bccd70ab9d0e8ee19dae4e275f2af95ced  mupdf-1.23.9-source.tar.lz
 
 # Locally computed:

--===============4779918313984307777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4779918313984307777==--
