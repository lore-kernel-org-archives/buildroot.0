Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BAC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 11:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EB2B41860;
	Sun, 14 Jan 2024 11:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EB2B41860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hGakI_QA3mr; Sun, 14 Jan 2024 11:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B4AA4182D;
	Sun, 14 Jan 2024 11:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B4AA4182D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC0011BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B28EF60E27
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 11:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B28EF60E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuyG1SXwMxxH for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 11:13:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECBF660EA1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 11:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECBF660EA1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5FC786116; Sun, 14 Jan 2024 11:13:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 12:11:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0b9be1872a4fa41de0356888915e2ea4322fa72
X-Git-Newrev: 62036327f6ded08ceae01f9b33cb3227ef106399
X-Patchwork-Hint: ignore
Message-Id: <20240114111308.D5FC786116@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=62036327f6ded08ceae01f9b33cb3227ef106399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e6af32c08c8d47a71d6f8fa48439f3d87dcef2f6 forgot to update hash of
COPYING (update in year:
https://github.com/smuellerDD/libkcapi/commit/fc937358e71253a6efaa3ba74885364976b040ea)

Fixes:
 - http://autobuild.buildroot.org/results/823c89ed3ac3f12e64a22bd88e193a5be28c34e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libkcapi/libkcapi.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index 691ef0977a..172b6cbcc7 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
 sha256  15b550c14165a266fa233b485d029d54508da593dfa6d1731ec5d5a285c716e9  libkcapi-1.5.0.tar.xz
-sha256  9765fad61726afb2b253db2c68153672e4178d6809667ae98141f3e90fe8645b  COPYING
+sha256  00e0a844d67b190580a9dc5943e555a3d0b2158e21d01a25526762c619979326  COPYING
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
