Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43D7C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 14:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 550F7408B1;
	Tue, 11 Jan 2022 14:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pahcFLDLOBnf; Tue, 11 Jan 2022 14:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AA37404F8;
	Tue, 11 Jan 2022 14:47:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D64701BF3DE
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 14:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CECCD82D7C
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 14:47:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id atJx5WQOmiPs for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 14:47:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BC882D04
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 14:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01B1D82B52; Tue, 11 Jan 2022 14:41:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 15:46:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c27065870a9ff8dac23b94fcf24699c003df4f2f
X-Git-Newrev: f51be73f25bdc9b370db42996475136098ebd251
X-Patchwork-Hint: ignore
Message-Id: <20220111144110.01B1D82B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Henrique Camargo
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
Content-Type: multipart/mixed; boundary="===============8576395812273333072=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8576395812273333072==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f51be73f25bdc9b370db42996475136098ebd251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

He has privately requested to no longer be notified regarding this
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 12777e8d61..44911a7d94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1183,9 +1183,6 @@ F:	package/linuxptp/
 F:	package/netopeer2/
 F:	package/sysrepo/
 
-N:	Henrique Camargo <henrique@henriquecamargo.com>
-F:	package/json-glib/
-
 N:	Hervé Codina <herve.codina@bootlin.com>
 F:	package/dtbocfg/
 F:	package/libdbi/

--===============8576395812273333072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8576395812273333072==--
