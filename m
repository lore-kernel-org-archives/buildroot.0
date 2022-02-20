Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F7BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 09:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB72340184;
	Sun, 20 Feb 2022 09:53:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JuXq_7CPFUs4; Sun, 20 Feb 2022 09:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3F2440445;
	Sun, 20 Feb 2022 09:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D2C1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23F61400F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYHgq1ParCle for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 09:53:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F4B340184
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 09:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 624C9812FE; Sun, 20 Feb 2022 09:45:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 10:52:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43e2a5e11f07d6fabd15f530ba98f7bbee73dac2
X-Git-Newrev: 59a813d2a884c2eb247d9695089375b56751b6d5
X-Patchwork-Hint: ignore
Message-Id: <20220220094533.624C9812FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: fix tarball sha256
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

commit: https://git.buildroot.net/buildroot/commit/?id=59a813d2a884c2eb247d9695089375b56751b6d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ab71ac15ddd7ed6a8ca83cbc23ea0b0cbb343f0f forgot to update sha256

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: update  hash for real ;-)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
