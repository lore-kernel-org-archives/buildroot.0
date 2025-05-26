Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C308C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4509160825;
	Sat, 31 May 2025 16:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1D-P_6ESlFj; Sat, 31 May 2025 16:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D44A60806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D44A60806;
	Sat, 31 May 2025 16:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C1F127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A70B83BEB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x07msiAxEm8M for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97FB183BB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97FB183BB3
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9680F87703; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:38:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89b4453ce6c3b1c30a23af44b879d4f2deaab107
X-Git-Newrev: 0dd1fddb4ca843a37211a28c0a4cf7d95582ca2b
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.9680F87703@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libsndfile:
 update project home page url
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

commit: https://git.buildroot.net/buildroot/commit/?id=0dd1fddb4ca843a37211a28c0a4cf7d95582ca2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The libsndfile package homepage url [1] points to an old site in which
the last update is for version 1.0.28 (April 2 2017). This site does
not seem to be maintained anymore.

This commit updates the libsndfile homepage url to [2].

[1] http://www.mega-nerd.com/libsndfile/
[2] https://libsndfile.github.io/libsndfile/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8bfdd3305e8db9ebe37b183b318e8f66478f8cae)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsndfile/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
index 4ccf937691..6fdc7fbd6c 100644
--- a/package/libsndfile/Config.in
+++ b/package/libsndfile/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBSNDFILE
 	  containing sampled sound (such as MS Windows WAV and the
 	  Apple/SGI AIFF format) through one standard library interface.
 
-	  http://www.mega-nerd.com/libsndfile/
+	  https://libsndfile.github.io/libsndfile/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
