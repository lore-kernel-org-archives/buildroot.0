Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDF1C4332F
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 08:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F19B484334;
	Fri, 21 Oct 2022 08:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F19B484334
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPlpqTzRVZW8; Fri, 21 Oct 2022 08:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341F684338;
	Fri, 21 Oct 2022 08:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 341F684338
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0FF61BF25F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 08:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB95E41DE6
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 08:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB95E41DE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZVx59oLa-UH for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 08:59:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F0F241DB3
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F0F241DB3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 08:59:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (23)
Received: from [192.168.10.50] (77-255-27-1.adsl.inetia.pl [77.255.27.1])
 by server220076.nazwa.pl (Postfix) with ESMTP id 39A061BC3A0;
 Fri, 21 Oct 2022 10:58:59 +0200 (CEST)
Message-ID: <51bbccf8-bbc4-91d5-95eb-56ce8b077d65@grinn-global.com>
Date: Fri, 21 Oct 2022 10:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221017053654.7D60A1BBFC4@server220076.nazwa.pl>
Content-Language: en-US
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <20221017053654.7D60A1BBFC4@server220076.nazwa.pl>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-10-16
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 17.10.2022 07:36, Thomas Petazzoni wrote:
> Hello,
>
> Outdated packages
> =================
>
> This is the list of packages for which a new version has been detected
> and for which you are a registered developer. Please help us improving
> the quality of Buildroot by bumping these packages to their latest
> version.
>
>               name              | found by |        link to release-monitoring.org        |   version    |   upstream
> -------------------------------+----------+----------------------------------------------+--------------+--------------
>                  python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 4.1          | 4.3
>                            ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.7.0        | 1.7.1

here you go:

https://patchwork.ozlabs.org/project/buildroot/patch/20221020211313.874624-2-b.bilas@grinn-global.com/

https://patchwork.ozlabs.org/project/buildroot/patch/20221020211313.874624-1-b.bilas@grinn-global.com/

Best
Bartek
>
> Thanks for your contribution to Buildroot!
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
