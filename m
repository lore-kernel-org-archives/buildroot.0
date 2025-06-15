Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B298C61CE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 16:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EFE980EB0;
	Sun, 15 Jun 2025 16:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h_wrF_l1cBU; Sun, 15 Jun 2025 16:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3CD80E7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3CD80E7B;
	Sun, 15 Jun 2025 16:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F2B151
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6239F400AE
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8qgHTQ8ij_9 for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 16:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93F6040131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93F6040131
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 16:05:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82D0E83AC1; Sun, 15 Jun 2025 16:05:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 17:40:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aefdca1e5cf75ef0322b5a9d9052e9fc683f5a41
X-Git-Newrev: 15996bc4ffed232b238d825351244aeeb31babbd
X-Patchwork-Hint: ignore
Message-Id: <20250615160512.82D0E83AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-requests: update project
 homepage
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

commit: https://git.buildroot.net/buildroot/commit/?id=15996bc4ffed232b238d825351244aeeb31babbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://www.python-requests.org/ is dead, the project lives on
https://requests.readthedocs.io/ now.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-requests/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 94a44682f4..929b99657c 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_PYTHON_REQUESTS
 	  Requests is an Apache2 Licensed HTTP library, written in
 	  Python, for human beings.
 
-	  http://www.python-requests.org/
+	  https://requests.readthedocs.io
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
