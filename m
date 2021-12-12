Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5134C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9207D401A3;
	Sun, 12 Dec 2021 22:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIZ6hAwfjEdt; Sun, 12 Dec 2021 22:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F82E40223;
	Sun, 12 Dec 2021 22:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EEE61BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F170A60ECB
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZ5By3zliEwH for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:22:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36F4C60E83
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:22:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 87A8083661; Sun, 12 Dec 2021 22:17:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:22:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e39d5fb074807ee2e1725549d555153262626e41
X-Git-Newrev: a1c0f17a5386e0eee9199c3ef5b63459fb459dfb
X-Patchwork-Hint: ignore
Message-Id: <20211212221735.87A8083661@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iperf: update sha256 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1c0f17a5386e0eee9199c3ef5b63459fb459dfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ca39eb212e32ca209cb3d6011847f9c94641fa73 forgot to update sha256
hash

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/iperf/iperf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index bd5643af95..924d10b3e0 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -2,5 +2,5 @@
 sha1  b9d0868a6cdd970c1835d3d1a264dd54907f2c5c  iperf-2.1.5.tar.gz
 
 # Locally computed:
-sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
+sha256  56ec1312d24bd2c78790e67c96c0a991c82e71bc4c0b0d37171bd89c9fd6ef3e  iperf-2.1.5.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
