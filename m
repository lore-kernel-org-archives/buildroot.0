Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22A4EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59B1B610EF;
	Tue, 25 Jul 2023 19:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59B1B610EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QpQn1JZTLMU; Tue, 25 Jul 2023 19:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E21D60760;
	Tue, 25 Jul 2023 19:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E21D60760
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33D791BF376
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ACAC82039
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACAC82039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwDYOHz8rO79 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 411D682031
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411D682031
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DF2982901; Tue, 25 Jul 2023 19:01:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 21:00:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b19030f3f7505af8c026cb63f0f4f509836d1e9
X-Git-Newrev: 7c46330cb646393a7d02ef7a73c0db74d44b28aa
X-Patchwork-Hint: ignore
Message-Id: <20230725190124.2DF2982901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: renumber patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c46330cb646393a7d02ef7a73c0db74d44b28aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit c02707a34226c15426b9cac35aefda7d7e9b0125 added two
upstream patches with the same number, renumber the younger patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...SSL-3.7.0.patch => 0002-fixed-compatibility-with-LibreSSL-3.7.0.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch b/package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
similarity index 100%
rename from package/opensc/0001-fixed-compatibility-with-LibreSSL-3.7.0.patch
rename to package/opensc/0002-fixed-compatibility-with-LibreSSL-3.7.0.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
