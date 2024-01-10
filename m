Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5FBC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D3AB435DE;
	Wed, 10 Jan 2024 09:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D3AB435DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gD7zErn4CnGu; Wed, 10 Jan 2024 09:49:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C8F7435FB;
	Wed, 10 Jan 2024 09:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8F7435FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B3BC1BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81119416C8
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81119416C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tW22TtvwEFkZ for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68BF14160B
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68BF14160B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56868852E0; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:40:22 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5173d24fc98aea900e0dec40cece6cd51e628260
X-Git-Newrev: 3a58c4cfe702ca97fdca9376fc5743c4f67751b3
X-Patchwork-Hint: ignore
Message-Id: <20240110094924.56868852E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opensc: renumber
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a58c4cfe702ca97fdca9376fc5743c4f67751b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Buildroot commit c02707a34226c15426b9cac35aefda7d7e9b0125 added two
upstream patches with the same number, renumber the younger patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7c46330cb646393a7d02ef7a73c0db74d44b28aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
