Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B7BC43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 08:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 614E140C3C;
	Thu,  1 Dec 2022 08:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 614E140C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uPNjyonxDA_v; Thu,  1 Dec 2022 08:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9435540150;
	Thu,  1 Dec 2022 08:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9435540150
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 964781BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E67B81F59
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E67B81F59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcDM-BFiClNx for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 08:05:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AE381E4D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9AE381E4D
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 08:05:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52E2E1BF20D;
 Thu,  1 Dec 2022 08:05:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0eZl-006L0V-J9; Thu, 01 Dec 2022 09:05:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20221130074444.829636-1-christian@paral.in>
Date: Thu, 01 Dec 2022 09:05:45 +0100
In-Reply-To: <20221130074444.829636-1-christian@paral.in> (Christian Stewart's
 message of "Tue, 29 Nov 2022 23:44:43 -0800")
Message-ID: <877czbczvq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/balena-engine: bump to version
 20.10.21
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > https://github.com/balena-os/balena-engine/blob/v20.10.21/CHANGELOG.md

Is this for 2022.11 or 2023.02? I don't right away see anything
important?

> Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/balena-engine/balena-engine.hash | 2 +-
 >  package/balena-engine/balena-engine.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/balena-engine/balena-engine.hash b/package/balena-engine/balena-engine.hash
 > index ef590881f5..4adb8ce561 100644
 > --- a/package/balena-engine/balena-engine.hash
 > +++ b/package/balena-engine/balena-engine.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  43f4c985b855a4f731a5cdac214f1adf6c4cc2021cbad3f93856009df246d61c  balena-engine-20.10.12.tar.gz
 > +sha256  4fb38109d133d499de366466a612fb6f523ea99d56fcd69b45dc494a75fbce0f  balena-engine-20.10.21.tar.gz
 >  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
 > diff --git a/package/balena-engine/balena-engine.mk b/package/balena-engine/balena-engine.mk
 > index 0afcea3d7e..ecfb62bfbf 100644
 > --- a/package/balena-engine/balena-engine.mk
 > +++ b/package/balena-engine/balena-engine.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -BALENA_ENGINE_VERSION = 20.10.12
 > +BALENA_ENGINE_VERSION = 20.10.21
 >  BALENA_ENGINE_SITE = $(call github,balena-os,balena-engine,v$(BALENA_ENGINE_VERSION))
 
 >  BALENA_ENGINE_LICENSE = Apache-2.0
 > -- 

 > 2.38.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
