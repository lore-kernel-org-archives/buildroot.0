Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B9BC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 12:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89BE060BA2;
	Mon, 16 Jan 2023 12:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89BE060BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnQ-AGVTwMyM; Mon, 16 Jan 2023 12:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC7C560AD1;
	Mon, 16 Jan 2023 12:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC7C560AD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A015A1BF2F6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 12:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 885AE81465
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 12:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 885AE81465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2YRH7bWWtd0 for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 12:52:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D8C681464
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D8C681464
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 12:52:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9551B1BF208;
 Mon, 16 Jan 2023 12:52:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pHOy2-0082Ol-Bd; Mon, 16 Jan 2023 13:52:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20230114104832.12702-1-heiko.thiery@gmail.com>
 <20230114104832.12702-3-heiko.thiery@gmail.com>
Date: Mon, 16 Jan 2023 13:52:02 +0100
In-Reply-To: <20230114104832.12702-3-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Sat, 14 Jan 2023 11:48:34 +0100")
Message-ID: <87sfga4p71.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/libnetconf2: bump version 2.2.12
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
Cc: Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 > ---
 >  package/sysrepo/sysrepo.hash | 2 +-
 >  package/sysrepo/sysrepo.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
 > index 1db33df626..a90d8259bf 100644
 > --- a/package/sysrepo/sysrepo.hash
 > +++ b/package/sysrepo/sysrepo.hash
 > @@ -1,3 +1,3 @@
 >  # Locally calculated
 > -sha256  357a50851e4cc052b484b924ed0a5808c29159a7c9d48d9b1b8c42784c4b6917  sysrepo-2.1.64.tar.gz
 > +sha256  1bc866f13e41ba5e7e4acd52b5c3d42b1a2a1e032775e0a9b094f3265844cd25  sysrepo-2.2.12.tar.gz
 >  sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
 > diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
 > index 0ed27e3cfb..9da8c22ca2 100644
 > --- a/package/sysrepo/sysrepo.mk
 > +++ b/package/sysrepo/sysrepo.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SYSREPO_VERSION = 2.1.64
 > +SYSREPO_VERSION = 2.2.12

NIT: This is sysrepo, not libnetconf2.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
