Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C9C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 08:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1155061250;
	Fri, 16 May 2025 08:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tam2iIpudyP4; Fri, 16 May 2025 08:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C9860AEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C9860AEE;
	Fri, 16 May 2025 08:17:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E3F413D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F51940906
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jmn55ESBb0sS for <buildroot@buildroot.org>;
 Fri, 16 May 2025 08:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C44E4223C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C44E4223C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 08:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80DCE8692B; Fri, 16 May 2025 08:17:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 10:14:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84d9cf3abe32761f52c778973e5b8968f3f8960b
X-Git-Newrev: 8bfdd3305e8db9ebe37b183b318e8f66478f8cae
X-Patchwork-Hint: ignore
Message-Id: <20250516081706.80DCE8692B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsndfile: update project home
 page url
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bfdd3305e8db9ebe37b183b318e8f66478f8cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libsndfile package homepage url [1] points to an old site in which
the last update is for version 1.0.28 (April 2 2017). This site does
not seem to be maintained anymore.

This commit updates the libsndfile homepage url to [2].

[1] http://www.mega-nerd.com/libsndfile/
[2] https://libsndfile.github.io/libsndfile/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
