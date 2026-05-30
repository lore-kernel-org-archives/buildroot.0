Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D607CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA96857CC;
	Tue,  9 Jun 2026 13:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDJm4SO8WpMf; Tue,  9 Jun 2026 13:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEAA885CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010297;
	bh=xz0gcFWt3WKWOQuSu8aJ5oV0XA7k3oUCwOSONLk4PTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UCUaqarBb9XNgT23dC4sS3Y0ziOOclhWjYJyY/XTiKdvCjQjQPI3Qr+0/KXgswh8K
	 982Tv87cW5yBqlcR+GCjl5hGCYFrVyhUgKiDIP8cDPKWDGCy83vyoUgD7U2xnHkj1d
	 tsBYkeoS2j0IKeTj+wbV1yEAdj8tEw9MFORBjuUynDqxcf5ohwpYOUCmrAI+wN7TFP
	 LVyS/OCHDi20n7Mcz0ERwMLtT/ezAceL9gJgIu1IKto2SzyReB77Xgoto1BrDJPN1o
	 GBfPcZWzXyv4WF6PmlgYaSa8xu0aluJVePDbY+DMbUeukxhYOUCUE9egRhAUaXhF6p
	 4ZZjMpaRQ8yXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEAA885CD7;
	Tue,  9 Jun 2026 13:04:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D388A190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A21426E4
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynXrvsaMemSf for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D31FB426EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D31FB426EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC0487E69; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 19:44:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1abbae02ed573ebd29b3c0984bb9a8f04232ff3
X-Git-Newrev: e6e989615286e317992bfab7de878c3ae7069443
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.1BC0487E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Shubham Chakraborty for
 font-awesome
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e6e989615286e317992bfab7de878c3ae7069443
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b474c96324..95fa87d448 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3056,6 +3056,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/dos2unix/
+F:	package/font-awesome/
 F:	package/hyperfine/
 F:	package/libenca/
 F:	package/pv/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
