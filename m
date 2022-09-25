Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05457C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8481A416F7;
	Sun, 25 Sep 2022 08:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8481A416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75yb7s5f3et7; Sun, 25 Sep 2022 08:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD4D416D5;
	Sun, 25 Sep 2022 08:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD4D416D5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00FA71BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0C45402BC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0C45402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ti7jbZU6ImX for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:51:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 039E440191
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 039E440191
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:51:34 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 1381C7802E5
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 10:51:33 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ocNMK-0003h1-PG; Sun, 25 Sep 2022 10:51:32 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ocNMK-0054Ae-3V; Sun, 25 Sep 2022 10:51:32 +0200
Date: Sun, 25 Sep 2022 10:51:32 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925085132.5knbwmk7avxgfifl@zenon.in.qult.net>
References: <20220922133430.l6graemwo6jg2gf5@zenon.in.qult.net>
 <20220925095736.28c462f5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925095736.28c462f5@windsurf>
Subject: Re: [Buildroot] [PATCH v4] package/chartjs: bump to version 3.9.1
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

On Sun, Sep 25, 2022 at 09:57:36AM +0200, thus spake Thomas Petazzoni:
> Hello Ignacy,
> =

> On Thu, 22 Sep 2022 15:34:30 +0200
> Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr> wrote:
> =

> > -CHARTJS_VERSION =3D 2.9.4
> > -CHARTJS_SITE =3D $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
> > +CHARTJS_VERSION =3D 3.9.1
> > +CHARTJS_SITE =3D https://registry.npmjs.org/chart.js/-
> > +CHARTJS_SOURCE =3D chart.js-$(CHARTJS_VERSION).tgz
> >  CHARTJS_LICENSE =3D MIT
> >  CHARTJS_LICENSE_FILES =3D LICENSE.md
> >  CHARTJS_CPE_ID_VENDOR =3D chartjs
> =

> I'm afraid this breaks the build:
> =

>   http://autobuild.buildroot.net/?reason=3Dchartjs-3.9.1
> =

> Could you have a look?

Hello,

I'm sorry, I messed up something with the various patch versions.  I
just posted a v5 which should be fine.

Ignacy

-- =

Ignacy Gaw=EAdzki
R&D Engineer
Green Communications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
