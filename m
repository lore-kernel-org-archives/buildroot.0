Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB94C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 15:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAEE482733;
	Wed, 10 Aug 2022 15:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAEE482733
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6aIcoIC2Ehr; Wed, 10 Aug 2022 15:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FD4582681;
	Wed, 10 Aug 2022 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD4582681
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 077841BF5E0
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4E546109D
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 15:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E546109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJaF5nQdWBzJ for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 15:37:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2718661067
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 15:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2718661067
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D46FD87096; Wed, 10 Aug 2022 15:22:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 17:33:45 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 74c890a556780b16b17d4d6b137156931d9a12de
X-Git-Newrev: c889b962a600640d3f4a9ea0cffbf33ee96062c6
X-Patchwork-Hint: ignore
Message-Id: <20220810152241.D46FD87096@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/stellarium: fix
 sha256 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=c889b962a600640d3f4a9ea0cffbf33ee96062c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

https://git.busybox.net/buildroot/commit/package/stellarium?id=5de73f0b685d7c2d096e3d28a50f2e89ed68c52c
forgot to change the filename to be checked with the sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bea626fbec2a09527498b9beb854a26e286592b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stellarium/stellarium.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 64238ad163..c742df464f 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
 sha1  55b5915dfb616b9748e1c2d2de6150f7159cf36c  stellarium-0.22.1.tar.gz
-sha256  61a595ecc345dcc7517359573d0dc772e67ecaf6d52fefab142a77c92cf3fa24  stellarium-0.22.0.tar.gz
+sha256  61a595ecc345dcc7517359573d0dc772e67ecaf6d52fefab142a77c92cf3fa24  stellarium-0.22.1.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
