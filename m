Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3113AC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 16:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC60881416;
	Sun, 19 Mar 2023 16:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC60881416
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sm_VISQeB8T; Sun, 19 Mar 2023 16:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BC1F813C9;
	Sun, 19 Mar 2023 16:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC1F813C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D52761BF2F8
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBE644025D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 16:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBE644025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fFTHjgvCjGke for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 16:48:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901BE400A6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 901BE400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 16:48:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AE977FF804;
 Sun, 19 Mar 2023 16:48:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pdwCS-006lcB-1A; Sun, 19 Mar 2023 17:48:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230314095234.284584-1-bagasdotme@gmail.com>
 <20230314095234.284584-3-bagasdotme@gmail.com>
Date: Sun, 19 Mar 2023 17:48:04 +0100
In-Reply-To: <20230314095234.284584-3-bagasdotme@gmail.com> (Bagas Sanjaya's
 message of "Tue, 14 Mar 2023 16:52:34 +0700")
Message-ID: <87v8iwwuuz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: Add entry for Bagas Sanjaya
 as Buildroot developer for git
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:

 > Bagas is keen to maintain git package for Buildroot. However, due to
 > limited resources available, he can only do testing as far as
 > build testing. Other developers are needed to help him maintain the
 > package.

 > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Committed to 2023.02.x and 2022.02.x, thanks.

> ---
 >  DEVELOPERS | 3 +++
 >  1 file changed, 3 insertions(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index b49491da7a..b6d288c54f 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -273,6 +273,9 @@ F:	package/orbit/
 >  N:	Attila Wagner <attila.wagner@onyxinsight.com>
 >  F:	package/python-canopen/
 
 > +N:	Bagas Sanjaya <bagasdotme@gmail.com>
 > +F:	package/git/
 > +
 >  N:	Bartosz Bilas <b.bilas@grinn-global.com>
 >  F:	board/stmicroelectronics/stm32mp157a-dk1/
 >  F:	configs/stm32mp157a_dk1_defconfig
 > -- 

 > An old man doll... just what I always wanted! - Clara

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
