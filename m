Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F1CCDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4014A60DC6;
	Fri, 13 Oct 2023 15:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4014A60DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4U-n3Wl_sKV; Fri, 13 Oct 2023 15:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F4CC60E35;
	Fri, 13 Oct 2023 15:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F4CC60E35
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 293DE1BF2F8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0179640597
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0179640597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZBsrQH5kC_V for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:42:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61E444053F
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61E444053F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40F4C40009;
 Fri, 13 Oct 2023 15:42:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrKIU-007NAD-RO; Fri, 13 Oct 2023 17:41:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231003124336.2837869-1-bernd@kuhls.net>
 <20231003204654.GH2957@scaer>
Date: Fri, 13 Oct 2023 17:41:54 +0200
In-Reply-To: <20231003204654.GH2957@scaer> (Yann E. MORIN's message of "Tue, 3
 Oct 2023 22:46:54 +0200")
Message-ID: <87cyxi34xp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libcodec2: bump version to 1.2.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > On 2023-10-03 14:43 +0200, Bernd Kuhls spake thusly:
 >> Release notes: https://github.com/drowe67/codec2/releases/tag/1.2.0
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> ---
 >> package/libcodec2/libcodec2.hash | 2 +-
 >> package/libcodec2/libcodec2.mk   | 4 ++--
 >> 2 files changed, 3 insertions(+), 3 deletions(-)
 >> 
 >> diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
 >> index edaa275bbc..828efa3e4d 100644
 >> --- a/package/libcodec2/libcodec2.hash
 >> +++ b/package/libcodec2/libcodec2.hash
 >> @@ -1,3 +1,3 @@
 >> # Locally computed
 >> -sha256  44015b071968d98ee326012c498db6a8308bed1a7a914ecb6d4d8e2a354a4611  libcodec2-1.1.1.tar.gz
 >> +sha256  cbccae52b2c2ecc5d2757e407da567eb681241ff8dadce39d779a7219dbcf449  libcodec2-1.2.0.tar.gz
 >> sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
 >> diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
 >> index 295dd8983f..5fc190aefd 100644
 >> --- a/package/libcodec2/libcodec2.mk
 >> +++ b/package/libcodec2/libcodec2.mk
 >> @@ -4,8 +4,8 @@
 >> #
 >> ################################################################################
 >> 
 >> -LIBCODEC2_VERSION = 1.1.1
 >> -LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
 >> +LIBCODEC2_VERSION = 1.2.0
 >> +LIBCODEC2_SITE = $(call github,drowe67,codec2,$(LIBCODEC2_VERSION))

 > I was curious to see that they dopped the leading 'v' in front of tags,
 > so I had a look at the repository, and indeed the 1.2.0 tag has no
 > leading 'v'.

 > But surprisingly, *there is no other tag*! Even the v1.1.1 tag that we
 > were using so far is missing!

 > So I had a look, and stumbled on:
 >     https://github.com/drowe67/codec2/issues/5

 > Basically, the full history was rewritten for some reason, the old
 > repository has been moved to;
 >     https://github.com/drowe67/codec2-dev/

 > So, this is an important bit of information: we need to fix the existing
 > maintenance branches to refer to the old repository (or backport this
 > commit).

How would we go about fixing the existing branches? Like the recent
rockchip-mali fix showed (f7f2de3da7e1), changing the name to the repo
also changes the tarball hash, but the filename stays the same.

I think I will simply leave it as is so Buildroot falls back to s.b.o
for now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
