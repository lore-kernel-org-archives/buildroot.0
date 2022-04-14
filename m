Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0549FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9167418EB;
	Thu, 14 Apr 2022 20:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82K64qr72tZi; Thu, 14 Apr 2022 20:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6966341762;
	Thu, 14 Apr 2022 20:12:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939C31BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FCC541762
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSJNc44Xw-6K for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:12:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92402416B5
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:12:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 80FEB1BF205;
 Thu, 14 Apr 2022 20:12:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nf5pg-00BrsI-Ih; Thu, 14 Apr 2022 22:12:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart <christian@paral.in>
References: <20220414193559.421041-1-christian@paral.in>
Date: Thu, 14 Apr 2022 22:12:48 +0200
In-Reply-To: <20220414193559.421041-1-christian@paral.in> (Christian Stewart's
 message of "Thu, 14 Apr 2022 12:35:59 -0700")
Message-ID: <87zgkna0fz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-proxy: bump to
 20220404 version 339b97
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

 > docker-proxy (libnetwork) has not added a release tag for a long time. Use the
 > latest master commit hash from 04 Apr 2022 instead.

 > 339b97

Dropped this line and committed, thanks.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/docker-proxy/docker-proxy.hash | 4 ++--
 >  package/docker-proxy/docker-proxy.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
 > index 58de697929..84bfa5518e 100644
 > --- a/package/docker-proxy/docker-proxy.hash
 > +++ b/package/docker-proxy/docker-proxy.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256	866c8d196b9396a383b437b0d775476459ed7c11f527c4f6bbf1fd08524b461d	docker-proxy-55685ba49593e67f5e1c8180539379b16736c25e.tar.gz
 > -sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14	LICENSE
 > +sha256  335851e924078a8e274f0c27cb80aaba32d0c1059068740496f1eb31b55a6ec4  docker-proxy-339b972b464ee3d401b5788b2af9e31d09d6b7da.tar.gz
 > +sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
 > diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
 > index 6600b24ed9..022aa1f949 100644
 > --- a/package/docker-proxy/docker-proxy.mk
 > +++ b/package/docker-proxy/docker-proxy.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -DOCKER_PROXY_VERSION = 55685ba49593e67f5e1c8180539379b16736c25e
 > +DOCKER_PROXY_VERSION = 339b972b464ee3d401b5788b2af9e31d09d6b7da
 >  DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 
 >  DOCKER_PROXY_LICENSE = Apache-2.0
 > -- 

 > 2.35.1


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
