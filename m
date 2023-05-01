Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2585FC77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8991561106;
	Mon,  1 May 2023 07:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8991561106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jb5MVuT6fIfn; Mon,  1 May 2023 07:15:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E9160767;
	Mon,  1 May 2023 07:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6E9160767
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6E21BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D818A40121
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D818A40121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_vWKkkxevE1 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:15:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DE7D400B8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DE7D400B8
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:15:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3CE6A240003;
 Mon,  1 May 2023 07:15:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptNl5-006Ww1-A2; Mon, 01 May 2023 09:15:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230428140726.2985631-1-bernd.kuhls@t-online.de>
Date: Mon, 01 May 2023 09:15:39 +0200
In-Reply-To: <20230428140726.2985631-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 28 Apr 2023 16:07:26 +0200")
Message-ID: <87ttwwldyc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.19.2
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

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

> ---
 >  package/xmrig/xmrig.hash | 2 +-
 >  package/xmrig/xmrig.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
 > index 781e089de8..665a710c70 100644
 > --- a/package/xmrig/xmrig.hash
 > +++ b/package/xmrig/xmrig.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  772f947058e5b89ca9bf34128487def47796870b547439a9b0524ddd1899420c  xmrig-6.19.0.tar.gz
 > +sha256  84b7d1cc0bb818d471d47a5e663839ae8ba8b8a3b641e227b03903125446e12c  xmrig-6.19.2.tar.gz
 >  sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
 > diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
 > index f345ba9cf9..ee2d5f5959 100644
 > --- a/package/xmrig/xmrig.mk
 > +++ b/package/xmrig/xmrig.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -XMRIG_VERSION = 6.19.0
 > +XMRIG_VERSION = 6.19.2
 >  XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 >  XMRIG_LICENSE = GPL-3.0+
 >  XMRIG_LICENSE_FILES = LICENSE
 > -- 

 > 2.39.2

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
