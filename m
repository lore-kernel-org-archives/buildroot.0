Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FAFC7115C
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 16:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A42D683B3D;
	Fri, 20 Jun 2025 16:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmkYvrv0Uoaq; Fri, 20 Jun 2025 16:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AE183C87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AE183C87;
	Fri, 20 Jun 2025 16:30:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3264AC8
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FA30607AA
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rb4AfDKYWtzK for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 16:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D43F6078A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D43F6078A
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 16:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BB8783E5B; Fri, 20 Jun 2025 16:30:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 18:28:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0233c854b1845e0070179439a74b3b5245a4b01b
X-Git-Newrev: fdef1a10eb0bf0915fcf746d0e09b0eb843d33d4
X-Patchwork-Hint: ignore
Message-Id: <20250620163019.4BB8783E5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/support.html: add Benetti
 Engineering to the commercial support list
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdef1a10eb0bf0915fcf746d0e09b0eb843d33d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As Benetti Engineering I keep contributing since 8 years more or less on
many packages and I've learnt a lot by joining this community. Most of all
I've received precious reviews from maintainers of today and yesterday.
Also, finally I've found some time to create my company logo and so let's
add Benetti Engineering to commercial support using LinkedIn page as
placeholder until the final website will be ready.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/images/benetti-engineering-logo.png | Bin 0 -> 97268 bytes
 docs/website/support.html                        |   3 +++
 2 files changed, 3 insertions(+)

diff --git a/docs/website/images/benetti-engineering-logo.png b/docs/website/images/benetti-engineering-logo.png
new file mode 100644
index 0000000000..0328caf962
Binary files /dev/null and b/docs/website/images/benetti-engineering-logo.png differ
diff --git a/docs/website/support.html b/docs/website/support.html
index 21c6e0a34e..9c44980e67 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -139,6 +139,9 @@
 	    <a href="https://www.amarulasolutions.com/services/integrated-system/">
 	      <img src="images/amarula-solutions-logo.png" style="max-width:200px; margin-right:40px;"/>
 	    </a>
+	    <a href="https://www.linkedin.com/company/benetti-engineering-sas">
+	      <img src="images/benetti-engineering-logo.png" style="max-width:260px; margin-right:40px;"/>
+	    </a>
 	  </center>
 	</div>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
