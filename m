Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D79C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3ACE8203B;
	Wed,  5 Apr 2023 20:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3ACE8203B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNBD6xjmJHPI; Wed,  5 Apr 2023 20:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7592682126;
	Wed,  5 Apr 2023 20:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7592682126
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B26BE1BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9765141903
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9765141903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfvgdcOwuXdI for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:14:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AAF94191A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2AAF94191A
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:14:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38F93E0002;
 Wed,  5 Apr 2023 20:14:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pk9WZ-00Bx2H-9b; Wed, 05 Apr 2023 22:14:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
References: <20230404230029.32385-1-peter.macleod.thompson@gmail.com>
 <20230404230029.32385-2-peter.macleod.thompson@gmail.com>
Date: Wed, 05 Apr 2023 22:14:31 +0200
In-Reply-To: <20230404230029.32385-2-peter.macleod.thompson@gmail.com> (Peter
 Thompson's message of "Tue, 4 Apr 2023 17:00:29 -0600")
Message-ID: <87v8iajdco.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/sdl2_image: bump version to
 2.6.3
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

>>>>> "Peter" == Peter Thompson <peter.macleod.thompson@gmail.com> writes:

 > Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
 > ---
 >  package/sdl2_image/sdl2_image.hash | 9 ++++++---
 >  package/sdl2_image/sdl2_image.mk   | 2 +-
 >  2 files changed, 7 insertions(+), 4 deletions(-)

 > diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
 > index e1efa4debe..7ec84077d2 100644
 > --- a/package/sdl2_image/sdl2_image.hash
 > +++ b/package/sdl2_image/sdl2_image.hash
 > @@ -1,3 +1,6 @@
 > -# Locally calculated after checking https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.6.2.tar.gz.sig
 > -sha256  48355fb4d8d00bac639cd1c4f4a7661c4afef2c212af60b340e06b7059814777  SDL2_image-2.6.2.tar.gz
 > -sha256  28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt
 > +# Locally calculated
 > +sha256  931c9be5bf1d7c8fae9b7dc157828b7eee874e23c7f24b44ba7eff6b4836312c  SDL2_image-2.6.3.tar.gz
 > +sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
 > +
 > +
 > +

Same issue here. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
