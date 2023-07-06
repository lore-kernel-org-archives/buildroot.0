Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D1EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 12:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38CEF40585;
	Thu,  6 Jul 2023 12:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38CEF40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gabIeITepRRJ; Thu,  6 Jul 2023 12:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B962404FF;
	Thu,  6 Jul 2023 12:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B962404FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32F1B1BF85D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 12:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BFDC401F1
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 12:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFDC401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUAknDlMn9hI for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 12:08:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BB3A4016B
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BB3A4016B
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 12:08:09 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C224000D;
 Thu,  6 Jul 2023 12:08:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qHNmI-003FpR-Jc; Thu, 06 Jul 2023 14:08:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>, Romain Naour
 <romain.naour@gmail.com>
References: <20230601163601.44832-1-bernd.kuhls@t-online.de>
Date: Thu, 06 Jul 2023 14:08:06 +0200
In-Reply-To: <20230601163601.44832-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 1 Jun 2023 18:36:01 +0200")
Message-ID: <87y1jtz1i1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/busybox: bump version to
 1.36.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

> ---
 >  package/busybox/busybox.hash | 4 ++--
 >  package/busybox/busybox.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
 > index 6d1c36906d..6eba365ecc 100644
 > --- a/package/busybox/busybox.hash
 > +++ b/package/busybox/busybox.hash
 > @@ -1,5 +1,5 @@
 > -# From https://busybox.net/downloads/busybox-1.35.0.tar.bz2.sha256
 > -sha256  542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5  busybox-1.36.0.tar.bz2
 > +# From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256
 > +sha256  b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314  busybox-1.36.1.tar.bz2
 >  # Locally computed
 >  sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 >  sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
 > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 > index fd4f3c17c5..eb5e7ad922 100644
 > --- a/package/busybox/busybox.mk
 > +++ b/package/busybox/busybox.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -BUSYBOX_VERSION = 1.36.0
 > +BUSYBOX_VERSION = 1.36.1
 >  BUSYBOX_SITE = https://www.busybox.net/downloads
 >  BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 >  BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
 > -- 

 > 2.39.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
