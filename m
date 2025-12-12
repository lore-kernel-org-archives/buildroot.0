Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BAFD43371
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1192410FD;
	Fri, 12 Dec 2025 07:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sjnflqxa2p0L; Fri, 12 Dec 2025 07:22:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2166A410E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765524133;
	bh=E0tWLJW9qn9+JQIrCPkYlPO1xd5+ckqBQqlvsqT482A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WOo+w4Jkm3JlSHoXL8vzXtAuC2acleKTyBwKR7f6Y2xGzzsZjswVV4oD4I78QstkN
	 5QfGMcgzY3DPxjiNFbXwnpbcDytwtYha1gOLQ/BSXkjnQRvHzXHD2PYDTUhu129Ds7
	 Zv1YRuuNQNfsqVqdwq4ZMq3eIbGZU17ICsUdlu3mISX0XenHlnOPADwoeqMKsExsH+
	 4E4NGkNBLwfhGwBV5sLwVSpLk4BBUeMsVr+3IysaljPyJ/yDUP/QUJwoXnggEpRBPR
	 oDLCUjbyLTKmAKjN8ty9Lf+8ys2XZVQnSNH/CxXhm2IXHRHWVbgON6qNI6NK+BVjvo
	 oiLFKk55ag5kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2166A410E3;
	Fri, 12 Dec 2025 07:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB612C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90D7B81395
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FIYHcQ_A4VS for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84A781380
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E84A781380
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D371986C8A; Fri, 12 Dec 2025 07:22:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 08:21:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08d71521d3da98939ce29dc0c673a21c8dc9277f
X-Git-Newrev: a6fb918153c77c24aa86da4c88402ff64ba33329
X-Patchwork-Hint: ignore
Message-Id: <20251212072210.D371986C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2025.11
 announcement link
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6fb918153c77c24aa86da4c88402ff64ba33329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index d8d83e92a8..bbb53ec429 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -20,7 +20,8 @@
 	<p>The stable 2025.11 release is out - Thanks to everyone
 	  contributing and testing the release candidates. See the
 	  <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/CHANGES">CHANGES</a>
-	  file for more details
+	  file for more details, read the
+	  <a href="https://lore.kernel.org/buildroot/87bjk439tj.fsf@dell.be.48ers.dk/T/#u">announcement</a>
 	  and go to the <a href="/downloads/">downloads page</a> to pick up the
 	  <a href="/downloads/buildroot-2025.11.tar.xz">2025.11 release</a>.</p>
       </div>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
