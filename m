Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFF2EB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 06:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85220416CD;
	Tue, 27 Jun 2023 06:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85220416CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-8l5GuT1UKB; Tue, 27 Jun 2023 06:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7601416B5;
	Tue, 27 Jun 2023 06:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7601416B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBADF1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 938B74187E
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 938B74187E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QM1-B6UfimO for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 06:10:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AE1F410E0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE1F410E0
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 06:10:53 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54409C0006;
 Tue, 27 Jun 2023 06:10:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qE1ub-008spt-Hg; Tue, 27 Jun 2023 08:10:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230611093156.655621-1-bernd.kuhls@t-online.de>
Date: Tue, 27 Jun 2023 08:10:49 +0200
In-Reply-To: <20230611093156.655621-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 11 Jun 2023 11:31:56 +0200")
Message-ID: <87mt0lxwnq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wget: bump version to 1.21.4
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

 > Release notes:
 > https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html

 > Added upstream sha1 hash.
 > Updated license hash due to copyright year bump:
 > https://git.savannah.gnu.org/gitweb/?p=wget.git;a=commitdiff;h=42239969300cae065e38781df3d157483897ff6b

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/wget/wget.hash | 8 +++++---
 >  package/wget/wget.mk   | 2 +-
 >  2 files changed, 6 insertions(+), 4 deletions(-)

 > diff --git a/package/wget/wget.hash b/package/wget/wget.hash
 > index 22674650a2..eed87e8e3d 100644
 > --- a/package/wget/wget.hash
 > +++ b/package/wget/wget.hash
 > @@ -1,6 +1,8 @@
 > +# From https://lists.gnu.org/archive/html/bug-wget/2023-05/msg00004.html
 > +sha1 42384273c1937458c9db3766a5509afa636a2f00  wget-1.21.4.tar.lz

You are missing a space after sha1 as pointed out by check-package:

package/wget/wget.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Committed with that fixed, thanks.

>  # Locally calculated after checking pgp signature
 > -# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
 > +# https://ftp.gnu.org/gnu/wget/wget-1.21.4.tar.lz.sig
 >  # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
 > -sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
 > +sha256  3683619a5f50edcbccb1720a79006fa37bf9b9a255a8c5b48048bc3c7a874bd9  wget-1.21.4.tar.lz


>  # Locally calculated
 > -sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
 > +sha256  f7dc7522e7e1be9227f3dc8de8b39a4d1d2471968c893af15f00c1a2076a0eec  COPYING
 > diff --git a/package/wget/wget.mk b/package/wget/wget.mk
 > index 455faaed12..d2d3087961 100644
 > --- a/package/wget/wget.mk
 > +++ b/package/wget/wget.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -WGET_VERSION = 1.21.3
 > +WGET_VERSION = 1.21.4
 >  WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 >  WGET_SITE = $(BR2_GNU_MIRROR)/wget
 >  WGET_DEPENDENCIES = host-pkgconf
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
