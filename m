Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70179C43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 10:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01544612F8;
	Wed, 13 Jul 2022 10:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01544612F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wzwh3IXxbwmh; Wed, 13 Jul 2022 10:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15CB461142;
	Wed, 13 Jul 2022 10:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15CB461142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E469F1BF484
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDB088416A
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB088416A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id osxoOkgkBbel for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 10:54:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 989D18415E
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 989D18415E
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 10:54:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D50F1200008;
 Wed, 13 Jul 2022 10:54:31 +0000 (UTC)
Message-ID: <72994ed7-f790-eb04-05df-fc94e889d941@korsgaard.com>
Date: Wed, 13 Jul 2022 12:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/apache: add brotli as optional
 dependency
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/06/2022 14.16, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/90e/90e3a2aaf0ce0451b80c71743209797abeb83d0a/
> http://autobuild.buildroot.net/results/006/006f94bb216a77f073a5670fa2f393c43f15a977/
> http://autobuild.buildroot.net/results/dd6/dd69e665e51ce6b30e303a4d4670e9edbb159aea/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2022.02.x and 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
