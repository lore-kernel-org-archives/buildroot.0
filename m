Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A12FC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 13:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A883340338;
	Sun,  6 Feb 2022 13:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLtKBm-hwZH4; Sun,  6 Feb 2022 13:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0A94032B;
	Sun,  6 Feb 2022 13:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 260F91BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E8E4032B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 13:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4z_bjeyqFh8 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 13:32:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C14E140325
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 13:32:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D689100002;
 Sun,  6 Feb 2022 13:32:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGhej-00089T-Hb; Sun, 06 Feb 2022 14:32:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
References: <20220206055330.11218-1-peter.macleod.thompson@gmail.com>
Date: Sun, 06 Feb 2022 14:32:41 +0100
In-Reply-To: <20220206055330.11218-1-peter.macleod.thompson@gmail.com> (Peter
 Thompson's message of "Sat, 5 Feb 2022 22:53:30 -0700")
Message-ID: <87k0e8xgqu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.0.18
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

 > From: PeterThompson <peter.macleod.thompson@gmail.com>
 > Signed-off-by: PeterThompson <peter.macleod.thompson@gmail.com>

NIT: You have a space missing before Thompson. You updated the hash of
the license file but didn't explain why.

Committed with that fixed, thanks.

 > ---
 >  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 >  package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
 > index 16459e4a59..a490b002b6 100644
 > --- a/package/sdl2_ttf/sdl2_ttf.hash
 > +++ b/package/sdl2_ttf/sdl2_ttf.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
 > -sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
 > +sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
 > +sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
 > diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
 > index 326cb99366..1fe7c0a075 100644
 > --- a/package/sdl2_ttf/sdl2_ttf.mk
 > +++ b/package/sdl2_ttf/sdl2_ttf.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SDL2_TTF_VERSION = 2.0.15
 > +SDL2_TTF_VERSION = 2.0.18
 >  SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 >  SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 >  SDL2_TTF_LICENSE = Zlib
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
