Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03C3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5240040BE1;
	Thu, 12 May 2022 08:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qXs9wAoiGxv; Thu, 12 May 2022 08:43:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A3BD40BD0;
	Thu, 12 May 2022 08:43:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA2D61BF84C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97FC160A71
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AaoN_3H47xH2 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:43:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B58160655
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:43:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A5BF100009;
 Thu, 12 May 2022 08:43:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1np4Pv-007gXE-Ag; Thu, 12 May 2022 10:43:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
References: <20220511051953.34515-1-br015@umbiko.net>
Date: Thu, 12 May 2022 10:43:27 +0200
In-Reply-To: <20220511051953.34515-1-br015@umbiko.net> (Andreas Ziegler's
 message of "Wed, 11 May 2022 07:19:53 +0200")
Message-ID: <87tu9v9m4w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.7
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
Cc: =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > Minor bug fixes, including upstream fix for meson iconv handling, which makes 
 > 0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch redundant. 

 > Introduces version dependencies for libshout and libupnp, which are met since 
 > 01/2021 (commit 118648d161). 

 > Full change log:
 >   https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.7/NEWS

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
