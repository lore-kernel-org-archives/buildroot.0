Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B17EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 892AA42230;
	Fri, 13 Feb 2026 19:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQFguikXts7O; Fri, 13 Feb 2026 19:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD44F42227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011583;
	bh=HSg0ATR7ZqjA85+GKH+deys6QzjiJZljZoyu6Tj4T/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MKXsY22UxsRBsNdCgeoHXj54bADMgOUeCYKiecByg+9ajeqklC0MLHndDWNgyG/wf
	 ++imGXVlZ0FCR0Ttf9fkGgGJM09MKQgKCg6J4fgmZju5jEmQ0As21Vkto8ATHK54Jn
	 MUWrTybuyP7Fi5B3hsCVdQlA0b6GUTYH+MXXzD9wWtU341D9hmNjpUj+Ft4iMfhn3Z
	 dYyPPbRZC+5BL7WtNHb7RFNpNItpk1s0ykrrawePkjjYSEOGo8b0reuGIvCGuroFNK
	 lNdDlFDDTpsrDng1vqEiIbgOlCNcRSwQXXkcEllxfYMyJLItyBUtGohNyUOu1pu5HU
	 HuVORFTiSDaaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD44F42227;
	Fri, 13 Feb 2026 19:39:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22AA669
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37398412DA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVU25pcFJ2Qf for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CF9E413E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CF9E413E9
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81EE183DBC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:37 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: da48583a936869c03933fa6bb5028be4042ed30f
X-Git-Newrev: d2ada422c03e5c0859bd1099799ac3333030a21e
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.81EE183DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mupdf: update
 release hashes comment
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
Content-Type: multipart/mixed; boundary="===============2824853964678422283=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2824853964678422283==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2ada422c03e5c0859bd1099799ac3333030a21e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

The old URL now leads to an HTTP 404 not found error.
Update it to the new one which contains the hashes for the current
release as well as older ones.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 6fed872e083c5d5d490977b2bffbd68ebd141f1b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 580235eeca..80de6f3b2c 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,4 +1,4 @@
-# From https://mupdf.com/downloads/index.html:
+# From https://mupdf.com/releases:
 sha1  d79600bccd70ab9d0e8ee19dae4e275f2af95ced  mupdf-1.23.9-source.tar.lz
 
 # Locally computed:

--===============2824853964678422283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2824853964678422283==--
