Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED184EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CEB4404B2;
	Sun, 18 Jun 2023 11:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CEB4404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6OpKsHr82SB; Sun, 18 Jun 2023 11:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B62C340541;
	Sun, 18 Jun 2023 11:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B62C340541
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4711BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64815402D4
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64815402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPAYiVEt1mFe for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:19:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C43240193
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C43240193
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:19:25 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAA2C1C0004;
 Sun, 18 Jun 2023 11:19:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qAqRF-000gdd-Rw; Sun, 18 Jun 2023 13:19:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230608185255.3505647-1-bernd.kuhls@t-online.de>
 <20230608185255.3505647-4-bernd.kuhls@t-online.de>
Date: Sun, 18 Jun 2023 13:19:21 +0200
In-Reply-To: <20230608185255.3505647-4-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 8 Jun 2023 20:52:55 +0200")
Message-ID: <87ilblj9vq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] package/libgpgme: bump to version 1.20.0
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Added upstream sha1 & sha256 hashes.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2023.02.x, thanks.

> ---
 >  package/libgpgme/libgpgme.hash | 7 +++----
 >  package/libgpgme/libgpgme.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 5 deletions(-)

 > diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
 > index 7d02b9e139..a71cec1e38 100644
 > --- a/package/libgpgme/libgpgme.hash
 > +++ b/package/libgpgme/libgpgme.hash
 > @@ -1,6 +1,5 @@
 > -# Locally calculated after checking pgp signature
 > -# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.17.1.tar.bz2.sig
 > -# using key 6DAA6E64A76D2840571B4902528897B826403ADA
 > -sha256  711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f  gpgme-1.17.1.tar.bz2
 > +# From https://www.gnupg.org/download/integrity_check.html
 > +sha1  369deeec95f1bb77fafc0b6c8fa65995ba82fd1e  gpgme-1.20.0.tar.bz2
 > +sha256  25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750  gpgme-1.20.0.tar.bz2
 >  # Locally calculated
 >  sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
 > diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
 > index 2120ee8e3c..21a0b30d3b 100644
 > --- a/package/libgpgme/libgpgme.mk
 > +++ b/package/libgpgme/libgpgme.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBGPGME_VERSION = 1.17.1
 > +LIBGPGME_VERSION = 1.20.0
 >  LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 >  LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 >  LIBGPGME_LICENSE = LGPL-2.1+
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
