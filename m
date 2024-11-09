Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE49D5E373
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 15:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26B3A40286;
	Sat,  9 Nov 2024 15:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAdDO24brujb; Sat,  9 Nov 2024 15:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17FD2402AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FD2402AC;
	Sat,  9 Nov 2024 15:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E7AC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 15:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B47AD80CEC
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 15:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XD92s6YY4GDr for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 15:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0444D80451
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0444D80451
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 15:50:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F182E85644; Sat,  9 Nov 2024 15:50:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 9 Nov 2024 16:29:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15501457f3be6bdfdfc7e407196f2b1d5a9c692f
X-Git-Newrev: cf2967a7ea305221ed1ed785592cdd7a25e35e7e
X-Patchwork-Hint: ignore
Message-Id: <20241109155035.F182E85644@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Brandon Maier to dtc
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf2967a7ea305221ed1ed785592cdd7a25e35e7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
[Julien: reword commit log one liner]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fa27155510..1d70e46e8d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -557,6 +557,10 @@ F:	package/vmtouch/
 F:	support/testing/tests/package/test_atftp.py
 F:	support/testing/tests/package/test_zip.py
 
+N:	Brandon Maier <brandon.maier@gmail.com>
+F:	package/dtc/
+F:	support/testing/tests/package/test_dtc*
+
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
