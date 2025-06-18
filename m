Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93333C7115B
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 13:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B82F40949;
	Thu, 19 Jun 2025 13:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSaxLmxkJAqJ; Thu, 19 Jun 2025 13:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C1740925
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C1740925;
	Thu, 19 Jun 2025 13:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE419E2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBB3A60BB1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2KecFmpBLTZ for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D1C8608A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D1C8608A6
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C62683F8A; Thu, 19 Jun 2025 13:48:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 11:10:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c2de84a3254f3468e8f689596b94cf3f43099e82
X-Git-Newrev: 109c9bcd240c909678bb4be8b059cadc32e37441
X-Patchwork-Hint: ignore
Message-Id: <20250619134846.0C62683F8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-requests:
 update project homepage
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

commit: https://git.buildroot.net/buildroot/commit/?id=109c9bcd240c909678bb4be8b059cadc32e37441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

http://www.python-requests.org/ is dead, the project lives on
https://requests.readthedocs.io/ now.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 15996bc4ffed232b238d825351244aeeb31babbd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
