Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F8BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 19:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F55960E4D;
	Mon, 28 Feb 2022 19:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utY21lpyEHM2; Mon, 28 Feb 2022 19:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11AE60899;
	Mon, 28 Feb 2022 19:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135BD1BF2CC
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 19:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0178A815CD
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 19:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Lh9FzSO8FUn for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 19:55:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21D77815CA
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 19:55:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 65B1582DFE; Mon, 28 Feb 2022 19:47:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 20:55:34 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 48cea1d9be4d9193eb4571aa2143c68a7012bb29
X-Git-Newrev: 6515cc2894663e345b543eab240180b06de2acfb
X-Patchwork-Hint: ignore
Message-Id: <20220228194735.65B1582DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/expat: fix
 tarball sha256
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

commit: https://git.buildroot.net/buildroot/commit/?id=6515cc2894663e345b543eab240180b06de2acfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f forgot to update sha256

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: update  hash for real ;-)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 59a813d2a884c2eb247d9695089375b56751b6d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 3129801668..10e13206d0 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -3,5 +3,5 @@ md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
 sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
 
 # Locally calculated
-sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
+sha256  b5d25d6e373351c2ed19b562b4732d01d2589ac8c8e9e7962d8df1207cc311b8  expat-2.4.4.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
