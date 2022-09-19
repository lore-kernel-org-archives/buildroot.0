Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D03EECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC14583E64;
	Mon, 19 Sep 2022 09:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC14583E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZTWDbNrJbdh; Mon, 19 Sep 2022 09:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D96A7832C6;
	Mon, 19 Sep 2022 09:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96A7832C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01C2E1BF3F9
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 09:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D109240B24
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 09:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D109240B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxQ1BR2VbrKZ for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 09:16:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1DED402E8
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1DED402E8
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 09:16:23 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 7D0D94D84A
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 11:16:15 +0200 (CEST)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 2C6C6780357
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 11:16:09 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1oaCsq-0003wm-SM; Mon, 19 Sep 2022 11:16:08 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1oaCsp-005jEn-U5; Mon, 19 Sep 2022 11:16:07 +0200
Date: Mon, 19 Sep 2022 11:16:07 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220919091607.a3n36rn44ct3iwuq@zenon.in.qult.net>
References: <20220913093235.wdaiq5lsy3mbcc6u@zenon.in.qult.net>
 <20220917151755.6dfaeb1b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220917151755.6dfaeb1b@windsurf>
Subject: Re: [Buildroot] [PATCH v3] package/chartjs: bump to version 3.9.1
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Sep 17, 2022 at 03:17:55PM +0200, thus spake Thomas Petazzoni:
> Hello Ignacy,

Hi,

> [...]
> > +define CHARTJS_BUILD_CMDS
> > +	cd $(@D) && $(NPM) install && $(NPM) run build
> =

> This is a bit worrying. What does it do? Does it download/install
> additional stuff? If so, it breaks reproducibility of the build, the
> download infrastructure logic, the legal-info logic, etc.
> =

> Could you provide more background on this?

Yes, this downloads and builds additional stuff.  I'm about to send a
v4 with a package-lock.json file which makes the dependencies stick to
precise versions, in order to make the builds reproducible (the
package-lock.json file is locally generated, since it is not provided
upstream).

There are already ongoing discussions about the way several new javascript
packages (forge, openlayers, vue.js) are to be built.  Since
retrieving ready-to-use files from registry.npmjs.org is not an
option, these have to be built using host-nodejs.

For me, both ways do the job, please tell me which one to use and I'll
be happy with it.

Thanks.

Ignacy

-- =

Ignacy Gaw=EAdzki
R&D Engineer
Green Communications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
