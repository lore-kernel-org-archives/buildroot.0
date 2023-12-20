Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD567C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61B12817ED;
	Wed, 20 Dec 2023 10:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61B12817ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fk0s40nmwRG6; Wed, 20 Dec 2023 10:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB568164A;
	Wed, 20 Dec 2023 10:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCB568164A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CFD41BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9D6641B8C
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9D6641B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92XIKMUWeVzq for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:49:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 295BD41BA2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295BD41BA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B3B40007;
 Wed, 20 Dec 2023 10:49:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rFu8T-00HTlH-07;
 Wed, 20 Dec 2023 11:49:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
References: <20231220020818.23843-1-peter.macleod.thompson@gmail.com>
Date: Wed, 20 Dec 2023 11:49:08 +0100
In-Reply-To: <20231220020818.23843-1-peter.macleod.thompson@gmail.com> (Peter
 Thompson's message of "Tue, 19 Dec 2023 19:08:18 -0700")
Message-ID: <87a5q587yz.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.8.1
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
 >  package/sdl2_image/sdl2_image.hash | 2 +-
 >  package/sdl2_image/sdl2_image.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
 > index 55b2661fc0..0236f1ed08 100644
 > --- a/package/sdl2_image/sdl2_image.hash
 > +++ b/package/sdl2_image/sdl2_image.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  931c9be5bf1d7c8fae9b7dc157828b7eee874e23c7f24b44ba7eff6b4836312c  SDL2_image-2.6.3.tar.gz
 > +sha256  e4cab9a58c347a490c46723c17553b4e12233cd821d3b993a8475a50497f5a3e  SDL2_image-2.6.3.tar.gz

You forgot to adjust the filename for the new version.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
