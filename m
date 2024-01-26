Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48F5C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 16:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54027420B1;
	Fri, 26 Jan 2024 16:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54027420B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xe4XOIBIQevT; Fri, 26 Jan 2024 16:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A2C9420AF;
	Fri, 26 Jan 2024 16:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A2C9420AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 366EB1BF284
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2444039D
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 16:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E2444039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EBU_vNOh-Ik8 for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 16:10:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1BBC401D2
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1BBC401D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4259FFF811
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 16:10:56 +0000 (UTC)
Message-ID: <d0021512-36e8-4394-be90-6b9741504872@korsgaard.com>
Date: Fri, 26 Jan 2024 17:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240115191122.264934-1-ju.o@free.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240115191122.264934-1-ju.o@free.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.28
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

On 15/01/2024 20.11, Julien Olivain wrote:
> For release announce, see:
> https://lists.infradead.org/pipermail/kexec/2024-January/029156.html
> 
> This commit removes the two package patches, which are now included
> in this new version.
> 
> The "KEXEC_AUTORECONF = YES" is also removed, since it is no longer
> needed (due to the patch removal).
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit dd22e80 with commands:

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
