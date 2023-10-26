Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EDAC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A42640227;
	Thu, 26 Oct 2023 16:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A42640227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JVUY9Y5tDApq; Thu, 26 Oct 2023 16:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BB29401D8;
	Thu, 26 Oct 2023 16:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BB29401D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A310B1BF3BC
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC7F6FA32
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AC7F6FA32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2S5tR9WOrFK for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF06A6FA31
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF06A6FA31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D77B85F64; Thu, 26 Oct 2023 16:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 18:58:39 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3d47381d4a4cf6dacfdcd43d404233a14c16f6c3
X-Git-Newrev: d19e8ca76870e02a0d4dcb33bb672a7e72ab5456
X-Patchwork-Hint: ignore
Message-Id: <20231026165949.9D77B85F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/xdg-dbus-proxy:
 fix tarball name in hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=d19e8ca76870e02a0d4dcb33bb672a7e72ab5456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes: 487761a5b2 ("package/xdg-dbus-proxy: bump to version 0.1.5")
Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4fc46f751c7cb3db3f4cbef10f67e5ab3d90135)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index 37f1790c9b..f61a6a91ae 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
 # From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.5
-sha256  061dcfaf8a0650e5fd9d5432dfe88bda749ea0d079dc136304bfecfbce0661fb  xdg-dbus-proxy-0.1.4.tar.xz
+sha256  061dcfaf8a0650e5fd9d5432dfe88bda749ea0d079dc136304bfecfbce0661fb  xdg-dbus-proxy-0.1.5.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
