Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ECDF60B53;
	Thu, 29 Sep 2022 21:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ECDF60B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEb1tQY6LHAY; Thu, 29 Sep 2022 21:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9870260B16;
	Thu, 29 Sep 2022 21:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9870260B16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8D3D1BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A012C400AC
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A012C400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iX06viJBYNV3 for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:13:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60CCE40018
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60CCE40018
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:13:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8133E240002;
 Thu, 29 Sep 2022 21:13:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oe0qO-009yND-KF; Thu, 29 Sep 2022 23:13:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220921213835.373860-1-fontaine.fabrice@gmail.com>
Date: Thu, 29 Sep 2022 23:13:20 +0200
In-Reply-To: <20220921213835.373860-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 21 Sep 2022 23:38:35 +0200")
Message-ID: <87o7ux6g0f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xtables-addons: bump to version
 3.21
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > v3.21 (2022-06-13)
 >     xt_ECHO: support flowi6_to_flowi_common starting Linux 5.10.121

 > v3.20 (2022-04-10)

 >     Support for Linux 5.17

 > v3.19 (2022-02-01)

 >     bumped minimum supported kernel version from 4.15 to 4.16
 >     xt_condition: make mutex per-net
 >     xt_ipp2p: add IPv6 support
 >     xt_ECHO, xt_TARPIT: do not build IPv6 parts if kernel has IPv6 build-time disabled

 > v3.18 (2021-03-11)

 >     xt_pknock: fix a build failure on ARM 32-bit

 > https://fossies.org/linux/privat/xtables-addons-3.21.tar.xz/xtables-addons-3.21/doc/changelog.rst

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b8f5f65cec1bd5c859f4a1fae4508900df362add

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
