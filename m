Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1362BC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A979882097;
	Sun,  7 May 2023 12:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A979882097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erkY4gVB6Jfe; Sun,  7 May 2023 12:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC23882076;
	Sun,  7 May 2023 12:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC23882076
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F74F1BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 191A781FC9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191A781FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Hmk9uj2FkeF for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:34:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F6FE81FC7
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F6FE81FC7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A9FF85F19; Sun,  7 May 2023 12:34:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 14:32:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ce2d42aa7f603f3441d3f7481372663b1a2090c
X-Git-Newrev: fa2700c4cd52e588249e5ce7c83956ce7fc4ec33
X-Patchwork-Hint: ignore
Message-Id: <20230507123405.3A9FF85F19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: add
 missing license hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa2700c4cd52e588249e5ce7c83956ce7fc4ec33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0ce2d42aa7f6 (package/kodi-inputstream-adaptive: update license
info) did a last-minute update to add all the license files, but forgot
to amend the hash file.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index f562fe193c..89efd14222 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -2,3 +2,8 @@
 sha256  6454f40c6e89e7ce2a9492197954bbef856ee83e242ef610c905d42aed7484d7  kodi-inputstream-adaptive-20.3.7-Nexus.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
+sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
+sha256  db15ad8651cae3da082c555f3b5a84ffe2b697695ba5e4d9d391395c15f7af14  LICENSES/BSD-3-Clause
+sha256  184867bbdccfe35775d9ce80ee9a5739d96a647d88b383f44351770c637a97f9  LICENSES/google-patent-license-webm
+sha256  ac71e3e4eb5973038a48907ed1b036e0fcd486033b342e38445c246f12c46b47  LICENSES/GPL-2.0-or-later
+sha256  44ed58e0d80f7d6261bba01aa5c8a59995ee0180512e1c2a47bfff1b5be240f2  LICENSES/RSA-MD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
