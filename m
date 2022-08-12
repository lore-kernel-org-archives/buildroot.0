Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34B2ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 253AD40B8A;
	Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 253AD40B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbVtTIzgz-eV; Sun, 11 Sep 2022 08:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E19A40B86;
	Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E19A40B86
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2E3A1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBBFE40B86
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBBFE40B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ePy-M0HsdoXF for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C3C240629
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C3C240629
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 17CDD835E4; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 00:03:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 446fb4f1706ba3a68804ce41d75d5174c5debe9d
X-Git-Newrev: 9b773d0189f902aac544d183e9e4b920879ec6e7
X-Patchwork-Hint: ignore
Message-Id: <20220911084823.17CDD835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add version 2.39
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b773d0189f902aac544d183e9e4b920879ec6e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0002-poison-system-directories.patch got rebased.
Patch 0004+0005 is upstreamed and got removed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/2.39/0001-sh-conf.patch           |  48 ++++
 .../2.39/0002-poison-system-directories.patch      | 298 +++++++++++++++++++++
 ...lf32-or1k-fix-building-with-gcc-version-5.patch |  50 ++++
 package/binutils/Config.in.host                    |   4 +
 package/binutils/binutils.hash                     |   1 +
 5 files changed, 401 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
