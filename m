Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A63C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7799E403F9;
	Sun, 28 Jul 2024 11:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hy1-IfNHC-B1; Sun, 28 Jul 2024 11:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA0140442
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA0140442;
	Sun, 28 Jul 2024 11:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3AE1BF471
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97D2B811FF
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xK3-dpPOLEC0 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5D9F81209
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5D9F81209
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D18DC87567; Sun, 28 Jul 2024 11:07:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 13:06:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5098b29472c20a7f39d0ca715e7a0c321e12474d
X-Git-Newrev: ed83248117ac1fdefaa3943d7a335a6481a92545
X-Patchwork-Hint: ignore
Message-Id: <20240728110735.D18DC87567@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/python-ruamel-yaml: fix comment in hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed83248117ac1fdefaa3943d7a335a6481a92545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9fb8f2e10c547fedb5a65db384c813a2850241d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ruamel-yaml/python-ruamel-yaml.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
index 29852a51ed..ee5016835b 100644
--- a/package/python-ruamel-yaml/python-ruamel-yaml.hash
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -1,4 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/rfc3987/json
+# md5, sha256 from https://pypi.org/pypi/ruamel.yaml/json
 md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
 sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
 # Locally computed sha256 checksums
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
