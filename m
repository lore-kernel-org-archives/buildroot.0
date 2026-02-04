Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB22AE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F352612F4;
	Wed,  4 Feb 2026 17:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIekB8ffFlge; Wed,  4 Feb 2026 17:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7784C60F69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224980;
	bh=ihXaVorxi7JOek+COGJOnJpOEK74q1Zs6p9MM6Pqxq4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b/sQVlWm0/UJeO24Zzxc8rbedaJra6SneqT1n54+IywCdZkcdaudWzp1P/9Dg5wXq
	 TJM4bMyLSVxl1iDNwxCqlmRlkzMCh+gIWg7WCz+YJrA2oGUKUvESdRq1XAwM+rUeDX
	 azJpwPVcQ6kf1oQYV3pSmpWsE2y9rfmVTYmNW94+nQJm3IMo4mj29F7FRMqCvoCi2/
	 6uKPlRv93BF/kNJhNJ7K76xT3ZJVknhbCqmRslOkv37/u+yU3/jy+/8EGhblncKCKU
	 5JeBx6Ne831yX+kbbUX7LROneOBiE0AGzAP4b73RrID0nkUKCn7dIaXRWryiK1VHHF
	 j9V4PYIBQhSdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7784C60F69;
	Wed,  4 Feb 2026 17:09:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B147BF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 430BF40580
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBW9BZr-WuNp for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4596405D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4596405D9
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C92788697C; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:45:23 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 643e767feb625cc27e1fac22294ee76270a57fea
X-Git-Newrev: 05d1828d374799899b4a000a9f4341e17c499757
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.C92788697C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: update e-mail
 for Frank Vanbever
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05d1828d374799899b4a000a9f4341e17c499757
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Signed-off-by: Frank Vanbever <fvb@funkworks.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f6062b7a8e91a763994b8fa1b5804a25a2be9cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f4df82102..f4a0b730b9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1203,7 +1203,7 @@ F:	package/sane-backends/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-N:	Frank Vanbever <frank.vanbever@mind.be>
+N:	Frank Vanbever <fvb@funkworks.be>
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
