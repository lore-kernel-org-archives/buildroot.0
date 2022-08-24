Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0F8C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 07:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F6C81A12;
	Wed, 24 Aug 2022 07:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F6C81A12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVxe-xyH07cI; Wed, 24 Aug 2022 07:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3968195D;
	Wed, 24 Aug 2022 07:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3968195D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3836C1BF844
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1353D8195D
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 07:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1353D8195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeU1wmMwiTem for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 07:47:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95CD08194C
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.18.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95CD08194C
 for <buildroot@busybox.net>; Wed, 24 Aug 2022 07:47:53 +0000 (UTC)
Received: from [91.21.124.120] (helo=exchange.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 (Exim 4.94.2)
 (envelope-from <mf@go-sys.de>)
 id 1oQl7D-00005y-7i; Wed, 24 Aug 2022 09:47:55 +0200
Received: from exchange.go-sys.local (192.168.1.17) by exchange.go-sys.local
 (192.168.1.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.2507.12; Wed, 24
 Aug 2022 09:46:48 +0200
Received: from exchange.go-sys.local ([::1]) by exchange.go-sys.local ([::1])
 with mapi id 15.01.2507.012; Wed, 24 Aug 2022 09:46:48 +0200
From: Michael Fischer <mf@go-sys.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to 2.6.2
Thread-Index: AQHYtf5+Jbv4rQ+NLEKuxtaU5Mb+ca28wWoAgADs8KA=
Date: Wed, 24 Aug 2022 07:46:48 +0000
Message-ID: <a9197d7c1c214548ae4712f607a7d241@go-sys.de>
References: <20220822080923.31060-1-mf@go-sys.de>
 <20220823213514.7edef928@windsurf>
In-Reply-To: <20220823213514.7edef928@windsurf>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.1.122]
x-c2processedorg: 77b28032-c882-4527-ad15-de6c89cb71cd
MIME-Version: 1.0
X-CrossPremisesHeadersFilteredBySendConnector: exchange.go-sys.local
X-OrganizationHeadersPreserved: exchange.go-sys.local
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.6.2
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
Cc: "buildroot@busybox.net" <buildroot@busybox.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,
sorry I mean the fixes from version 2.05. =


I compared it to the wrong version.

 Michael.

> -----Urspr=FCngliche Nachricht-----
> Von: Thomas Petazzoni [mailto:thomas.petazzoni@bootlin.com]
> Gesendet: Dienstag, 23. August 2022 21:35
> An: Michael Fischer <mf@go-sys.de>
> Cc: buildroot@busybox.net
> Betreff: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
> 2.6.2
> =

> Hello Michael,
> =

> On Mon, 22 Aug 2022 10:09:23 +0200
> Michael Fischer <mf@go-sys.de> wrote:
> =

> > Fixed a number of security issues
> =

> Could you clarify which security issues?
> =

> When I look at https://github.com/libsdl-org/SDL_image/releases, 2.0.5 did
> fix some security issues, but we're already using 2.0.5. For the next rel=
eases,
> I only see new features, or fixes for regressions.
> =

> Am I missing something?
> =

> Thanks!
> =

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin Embedded Linux and Kernel
> engineering and training https://bootlin.com
> =

> =


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
