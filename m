Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A42D743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 081F760662;
	Wed, 20 Nov 2024 21:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0OIIsWOgbXD; Wed, 20 Nov 2024 21:02:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B80A60B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B80A60B92;
	Wed, 20 Nov 2024 21:02:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33710970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 219E560A5D
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIlKn2O6R0IT for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC92605E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FC92605E1
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37569864E5; Wed, 20 Nov 2024 21:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:33:43 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: a91b9c7400fcd7813668f2fe6342cbd762c849e6
X-Git-Newrev: 35069b0ab586f85d141b157754348948fd47d141
X-Patchwork-Hint: ignore
Message-Id: <20241120210257.37569864E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 package/gobject-introspection: update homepage
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

commit: https://git.buildroot.net/buildroot/commit/?id=35069b0ab586f85d141b157754348948fd47d141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

The homepage has moved, the previous one links to the new URL.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ee7c891a0173417fbd4726928bd4d4689048b22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gobject-introspection/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 42250eb776..345118745f 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	  language bindings can read this metadata and automatically
 	  provide bindings to call into the C library.
 
-	  https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
+	  https://gi.readthedocs.io/
 
 comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
