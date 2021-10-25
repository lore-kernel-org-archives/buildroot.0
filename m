Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82316C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 10:56:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903D960F46
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 10:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 903D960F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD4B60858;
	Mon, 25 Oct 2021 10:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hj1N_tSWF9QJ; Mon, 25 Oct 2021 10:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5A460752;
	Mon, 25 Oct 2021 10:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2B371BF20D
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 10:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 926CA80D75
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 10:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWCcUXg_qaXG for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 10:56:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 453B880D70
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 10:56:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 11B61100003;
 Mon, 25 Oct 2021 10:56:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mexeb-0007C4-3U; Mon, 25 Oct 2021 12:56:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <fperrad@gmail.com>
References: <20211017132458.596283-1-francois.perrad@gadz.org>
Date: Mon, 25 Oct 2021 12:56:33 +0200
In-Reply-To: <20211017132458.596283-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 17 Oct 2021 15:24:58 +0200")
Message-ID: <87a6ixxti6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/htop: bump to version 3.1.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/htop/htop.hash | 2 +-
 >  package/htop/htop.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/htop/htop.hash b/package/htop/htop.hash
 > index 812392340..9de7926e3 100644
 > --- a/package/htop/htop.hash
 > +++ b/package/htop/htop.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  200a4f9331d0e5048bf9bda6a8dee38248c557e471b9e57ff3784853efd613a9  htop-3.1.0.tar.gz
 > +sha256  b52280ad05a535ec632fbcd47e8e2c40a9376a9ddbd7caa00b38b9d6bb87ced6  htop-3.1.1.tar.gz
 >  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 > diff --git a/package/htop/htop.mk b/package/htop/htop.mk
 > index b5aab3c30..cb434f3fb 100644
 > --- a/package/htop/htop.mk
 > +++ b/package/htop/htop.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -HTOP_VERSION = 3.1.0
 > +HTOP_VERSION = 3.1.1

The changelog has a statement:

- Update license headers to explicitly say GPLv2+

https://github.com/htop-dev/htop/blob/3.1.1/ChangeLog

But we still have HTOP_LICENSE = GPL-2.0, so that doesn't sound right.

Care to send a patch to fix that?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
