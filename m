Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDE8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E8A60F36
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9E8A60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B53A140773;
	Fri,  5 Nov 2021 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rD2Rs8Wl4vwN; Fri,  5 Nov 2021 16:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADB54076A;
	Fri,  5 Nov 2021 16:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4F781BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C00F3404A4
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:21:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hp2ESllCM1dI for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:21:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 301D340012
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:21:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 59742C0012;
 Fri,  5 Nov 2021 16:21:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mj1yR-0008V6-MC; Fri, 05 Nov 2021 17:21:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20211026190012.131232-1-bernd.kuhls@t-online.de>
Date: Fri, 05 Nov 2021 17:21:51 +0100
In-Reply-To: <20211026190012.131232-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Tue, 26 Oct 2021 21:00:12 +0200")
Message-ID: <87v916d140.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-audioencoder-lame: bump
 version to 19.1.0-Matrix
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
 > https://github.com/xbmc/audioencoder.lame/releases/tag/19.1.0-Matrix

 > Added libiconv as optional dependency when needed.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash | 2 +-
 >  package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk   | 6 +++++-
 >  2 files changed, 6 insertions(+), 2 deletions(-)

 > diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
 > index 7863ff497c..080bef06d2 100644
 > --- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
 > +++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  e2bdf17e5739cc025627a92421b967e5dda3cb35d2e4bb948a64ac97bf0e734e  kodi-audioencoder-lame-19.0.0-Matrix.tar.gz
 > +sha256  054593ea6572cd1e6ea771758bd759c630f47abef1ad2eeb332d453fc6c03e0b  kodi-audioencoder-lame-19.1.0-Matrix.tar.gz
 >  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
 > diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
 > index b774ac63e9..d2c2750022 100644
 > --- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
 > +++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -KODI_AUDIOENCODER_LAME_VERSION = 19.0.0-Matrix
 > +KODI_AUDIOENCODER_LAME_VERSION = 19.1.0-Matrix
 >  KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 >  KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 >  KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
 > @@ -12,4 +12,8 @@ KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 >  KODI_AUDIOENCODER_LAME_CONF_OPTS += \
 >  	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
 
 > +ifeq ($(BR2_ENABLE_LOCALE),)
 > +KODI_AUDIOENCODER_LAME_DEPENDENCIES += libiconv

Then you presumably need a:

select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

In Config.in?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
