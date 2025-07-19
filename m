Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946EEC83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 11:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA22E83E3F;
	Sat, 19 Jul 2025 11:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzI2xtMEdKO2; Sat, 19 Jul 2025 11:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 223C083486
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 223C083486;
	Sat, 19 Jul 2025 11:49:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01EC4117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC62582153
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkEw-ObsZrPD for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 11:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2889782037
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2889782037
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 11:49:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19373867B0; Sat, 19 Jul 2025 11:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 13:38:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 555c155007b692d07ce10e86807ba715a1e83dc5
X-Git-Newrev: 90fdb03f4730edef8946b29640ffda8783c244da
X-Patchwork-Hint: ignore
Message-Id: <20250719114936.19373867B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgpack: fix project url
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90fdb03f4730edef8946b29640ffda8783c244da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous url pointed to an unrelated but similarly named project.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-msgpack/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 2050d4f078..82b8c08417 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 	  This package provides a pure python library for reading
 	  and writing MessagePack data.
 
-	  https://pypi.python.org/pypi/msgpack-python/
+	  https://pypi.org/project/msgpack/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
