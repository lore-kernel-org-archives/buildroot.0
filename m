Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D475C61DB3
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 19:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5CFD41095;
	Thu, 12 Jan 2023 19:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5CFD41095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpMF-6P1YwVp; Thu, 12 Jan 2023 19:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8EA641028;
	Thu, 12 Jan 2023 19:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8EA641028
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1414E1BF46D
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1EBB4175D
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 19:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1EBB4175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-2KN1RPzRZp for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 19:17:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC9EB40869
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC9EB40869
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 19:17:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 60F07100003;
 Thu, 12 Jan 2023 19:17:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pG351-00365z-Cq; Thu, 12 Jan 2023 20:17:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
References: <20230110093537.16767-1-nicolas.cavallari@green-communications.fr>
Date: Thu, 12 Jan 2023 20:17:39 +0100
In-Reply-To: <20230110093537.16767-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Tue, 10 Jan 2023 10:35:37 +0100")
Message-ID: <878ri7d0ks.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iw: bump version to 5.19
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > ---

 > on top of 3a22b009992883ad57553ffb3f194303f90ad1a4:
 >                              arm-aarch64 [ 1/44]: OK
 >                    bootlin-aarch64-glibc [ 2/44]: OK
 >                bootlin-arcle-hs38-uclibc [ 3/44]: OK
 >                     bootlin-armv5-uclibc [ 4/44]: OK
 >                      bootlin-armv7-glibc [ 5/44]: OK
 >                    bootlin-armv7m-uclibc [ 6/44]: OK
 >                       bootlin-armv7-musl [ 7/44]: OK
 >                 bootlin-m68k-5208-uclibc [ 8/44]: OK
 >                bootlin-m68k-68040-uclibc [ 9/44]: OK
 >              bootlin-microblazeel-uclibc [10/44]: OK
 >                 bootlin-mipsel32r6-glibc [11/44]: OK
 >                    bootlin-mipsel-uclibc [12/44]: OK
 >                      bootlin-nios2-glibc [13/44]: OK
 >                  bootlin-openrisc-uclibc [14/44]: OK
 >         bootlin-powerpc64le-power8-glibc [15/44]: OK
 >            bootlin-powerpc-e500mc-uclibc [16/44]: OK
 >                    bootlin-riscv32-glibc [17/44]: OK
 >                    bootlin-riscv64-glibc [18/44]: OK
 >                     bootlin-riscv64-musl [19/44]: OK
 >                       bootlin-sh4-uclibc [20/44]: OK
 >                    bootlin-sparc64-glibc [21/44]: OK
 >                     bootlin-sparc-uclibc [22/44]: OK
 >                     bootlin-x86-64-glibc [23/44]: OK
 >                      bootlin-x86-64-musl [24/44]: OK
 >                    bootlin-x86-64-uclibc [25/44]: OK
 >                    bootlin-xtensa-uclibc [26/44]: OK
 >                             br-arm-basic [27/44]: OK
 >                     br-arm-full-nothread [28/44]: SKIPPED
 >                       br-arm-full-static [29/44]: OK
 >                    br-i386-pentium4-full [30/44]: OK
 >                 br-i386-pentium-mmx-musl [31/44]: OK
 >                       br-mips64-n64-full [32/44]: OK
 >                  br-mips64r6-el-hf-glibc [33/44]: OK
 >                br-powerpc-603e-basic-cpp [34/44]: OK
 >                br-powerpc64-power7-glibc [35/44]: OK
 >                        linaro-aarch64-be [36/44]: OK
 >                           linaro-aarch64 [37/44]: OK
 >                               linaro-arm [38/44]: OK
 >                      sourcery-arm-armv4t [39/44]: OK
 >                             sourcery-arm [40/44]: OK
 >                      sourcery-arm-thumb2 [41/44]: OK
 >                          sourcery-mips64 [42/44]: OK
 >                            sourcery-mips [43/44]: OK
 >                           sourcery-nios2 [44/44]: OK
 > 44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
