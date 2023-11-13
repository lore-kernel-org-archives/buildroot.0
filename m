Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F23EC4167B
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAD541C59;
	Mon, 13 Nov 2023 21:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAD541C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ldr0S4Uxc07r; Mon, 13 Nov 2023 21:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F96941B42;
	Mon, 13 Nov 2023 21:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F96941B42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59A5A1BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3048540C96
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3048540C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPkLbQPKneyH for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:48:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F63A4149A
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F63A4149A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67CA31C0004;
 Mon, 13 Nov 2023 21:48:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r2emu-00BYWr-2p;
 Mon, 13 Nov 2023 22:48:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20231112180101.1451451-1-giulio.benetti@benettiengineering.com>
 <20231112180101.1451451-2-giulio.benetti@benettiengineering.com>
Date: Mon, 13 Nov 2023 22:48:08 +0100
In-Reply-To: <20231112180101.1451451-2-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 12 Nov 2023 19:01:01 +0100")
Message-ID: <87o7fxe353.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to mongoose
 and swupdate
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 >  DEVELOPERS | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 69350fbb95..c0c3eefba6 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -1241,6 +1241,7 @@ F:	package/libtracefs
 >  F:	package/linux-tools/linux-tool-rtla.mk.in

Hmm, this doesn't seem to be against master?

Fixed up manually and committed, thanks.

 >  F:	package/mali-driver/
 >  F:	package/minicom/
 > +F:	package/mongoose/
 >  F:	package/mmc-utils/
 >  F:	package/nfs-utils/
 >  F:	package/python-libconf/
 > @@ -1259,6 +1260,7 @@ F:	package/sunxi-mali-utgard/
 >  F:	package/sunxi-mali-utgard-driver/
 >  F:	package/sunxi-tools/
 >  F:	package/swugenerator/
 > +F:	package/swupdate/
 >  F:	package/trace-cmd/
 >  F:	package/udisks/
 >  F:	package/wilc-driver/
 > -- 

 > 2.34.1

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
