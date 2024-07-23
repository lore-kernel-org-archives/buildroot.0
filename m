Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA5C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4CFF40AA4;
	Tue, 23 Jul 2024 08:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmInpPOiz0Sr; Tue, 23 Jul 2024 08:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C0E40A86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C0E40A86;
	Tue, 23 Jul 2024 08:55:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14EB51BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F220280EAC
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynIQb3oHAmmL for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44F3C80E94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44F3C80E94
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31A4D8718B; Tue, 23 Jul 2024 08:55:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:54:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 618aaf07af50bdf302c88716a8ff15d3aec3f024
X-Git-Newrev: e996d399b82aac7ebd7565bd33afe4d1b3635395
X-Patchwork-Hint: ignore
Message-Id: <20240723085505.31A4D8718B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: renumber patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=e996d399b82aac7ebd7565bd33afe4d1b3635395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 94e072849e6c86a8c75402b1e600642673ebfb57 forgot to renumber
latest patch

Fixes: 94e072849e6c86a8c75402b1e600642673ebfb57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ch => 0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch b/package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
similarity index 100%
rename from package/fluent-bit/0005-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
rename to package/fluent-bit/0004-Enhance-setting-write-gs-base-with-cmake-variable-30.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
