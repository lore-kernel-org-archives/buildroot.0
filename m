Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28686EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C464640363;
	Sun, 18 Jun 2023 11:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C464640363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9pRk0A-HxMF; Sun, 18 Jun 2023 11:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07C79402D4;
	Sun, 18 Jun 2023 11:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07C79402D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7761BF5AE
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 859C981B60
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 859C981B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7133XEZAvIBw for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:34:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E6C81B52
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62E6C81B52
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:34:41 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CFB4C0005;
 Sun, 18 Jun 2023 11:34:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qAqg2-000hEq-M2; Sun, 18 Jun 2023 13:34:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230610091731.3262187-1-bernd.kuhls@t-online.de>
Date: Sun, 18 Jun 2023 13:34:38 +0200
In-Reply-To: <20230610091731.3262187-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 10 Jun 2023 11:17:31 +0200")
Message-ID: <87ttv5gg1d.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.23.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.freedesktop.org/archives/wayland-devel/2022-June/042245.html
 > https://lists.freedesktop.org/archives/wayland-devel/2022-November/042515.html
 > https://lists.freedesktop.org/archives/wayland-devel/2023-January/042583.html
 > https://lists.freedesktop.org/archives/wayland-devel/2023-March/042642.html

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/libinput/libinput.hash | 2 +-
 >  package/libinput/libinput.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
 > index d8282ff03b..f6a67fc1ed 100644
 > --- a/package/libinput/libinput.hash
 > +++ b/package/libinput/libinput.hash
 > @@ -1,5 +1,5 @@
 >  # Locally computed
 > -sha256  08c003f724f361ed21f4dfbfe755a6c115b85385f1418907bb98f185457273f0  libinput-1.20.1.tar.bz2
 > +sha256  fad7011705a21f500229199f789f3e3e794b4c9826b70073745cdaec23bc1d0b  libinput-1.23.0.tar.bz2
 
 >  # License files
 >  sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
 > diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
 > index 07f20293ab..ff7b75077b 100644
 > --- a/package/libinput/libinput.mk
 > +++ b/package/libinput/libinput.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -LIBINPUT_VERSION = 1.20.1
 > +LIBINPUT_VERSION = 1.23.0
 >  LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 >  LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 >  LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev libudev

FYI, this doesn't match the code in master. We don't have a libudev
package, it is called udev - So I had to manually fix that up.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
