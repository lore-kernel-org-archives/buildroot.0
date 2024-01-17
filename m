Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD72C47DA7
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 12:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D026E40BEC;
	Wed, 17 Jan 2024 12:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D026E40BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2v6KqiGhC6qi; Wed, 17 Jan 2024 12:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4420405CD;
	Wed, 17 Jan 2024 12:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4420405CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 545891BF95D
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38EF1405CD
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38EF1405CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5VCvymgx93T for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 12:41:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6419A40144
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 12:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6419A40144
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AACB4000B;
 Wed, 17 Jan 2024 12:41:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rQ5EO-00Ft7e-1X;
 Wed, 17 Jan 2024 13:41:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
References: <20240116043311.18450-1-peter.macleod.thompson@gmail.com>
Date: Wed, 17 Jan 2024 13:41:20 +0100
In-Reply-To: <20240116043311.18450-1-peter.macleod.thompson@gmail.com> (Peter
 Thompson's message of "Mon, 15 Jan 2024 21:33:11 -0700")
Message-ID: <87y1coi13j.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.8.2
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

 > From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
 > Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
 > ---
 >  package/sdl2_image/sdl2_image.hash | 4 ++--
 >  package/sdl2_image/sdl2_image.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
 > index 0c4f11bc82..53a887c6f9 100644
 > --- a/package/sdl2_image/sdl2_image.hash
 > +++ b/package/sdl2_image/sdl2_image.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  e4cab9a58c347a490c46723c17553b4e12233cd821d3b993a8475a50497f5a3e  SDL2_image-2.8.1.tar.gz
 > -sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
 > +sha256  8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  SDL2_image-2.8.2.tar.gz
 > +sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt

You need to document why the license hash changed (in this case a change
in copyright year from 2023 to 2024).

Committed with that fixed, thanks.

> diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
 > index ca9d983892..40b9e3c915 100644
 > --- a/package/sdl2_image/sdl2_image.mk
 > +++ b/package/sdl2_image/sdl2_image.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SDL2_IMAGE_VERSION = 2.8.1
 > +SDL2_IMAGE_VERSION = 2.8.2
 >  SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 >  SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 >  SDL2_IMAGE_INSTALL_STAGING = YES
 > -- 

 > 2.20.1

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
