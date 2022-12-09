Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0598C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 08:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E10C41814;
	Fri,  9 Dec 2022 08:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E10C41814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2QOT90SmvUZ; Fri,  9 Dec 2022 08:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2523E4181E;
	Fri,  9 Dec 2022 08:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2523E4181E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACDC71BF3F4
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 08:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93A624181E
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 08:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A624181E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB8nyYBWDYAl for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 08:31:14 +0000 (UTC)
X-Greylist: delayed 00:09:48 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13C4B41814
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13C4B41814
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 08:31:13 +0000 (UTC)
Received: from x230_1.trabucayre.com ([78.252.129.8]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 2B98LMBY031213
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Dec 2022 09:21:22 +0100
Date: Fri, 9 Dec 2022 09:22:15 +0100
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20221209092215.5dcd9460@x230_1.trabucayre.com>
In-Reply-To: <20221209072525.527FF81ABA@smtp1.osuosl.org>
References: <20221209072525.527FF81ABA@smtp1.osuosl.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 194.57.88.66
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-12-08
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
Cc: gwe@trabucayre.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 09 Dec 2022 07:25:19 -0000
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Hello,
> 
> Autobuild statistics for 2022-12-08
> ===================================
> 
>       branch |  OK | NOK | TIM | TOT |
>   2022.02.x  |  7  |  2  |  0  |  9  |
>   2022.08.x  | 17  | 13  |  0  | 30  |
>     master   | 215 | 280 |  2  | 497 |
> 
> Classification of failures by reason for master
> -----------------------------------------------
> 
[...]
>                     volk-2.5.2 | 1 
[...] 
> 
> Detail of failures for master
> -----------------------------
> 
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
[...]
>     mips     |           volk-2.5.2           | NOK | http://autobuild.buildroot.net/results/5c4728f61cc56c3a75f0b9971910cef448703b13 |     
Weird: volk requires gcc >= 7 as explicitly noted in Config.in;
depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17

When applying this defconfig this warning is displayed:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_VOLK
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=n] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_MMU [=y]

It make sense because this defconfig for mips uses gcc 5.3.0 and this version has no support for c++17, resulting to this built failure.

[...] 
> -- 
> http://autobuild.buildroot.net
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
