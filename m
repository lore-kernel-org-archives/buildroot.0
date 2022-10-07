Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13833C433FE
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 07:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA7760EA6;
	Fri,  7 Oct 2022 07:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BA7760EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0uOD2-55ATr; Fri,  7 Oct 2022 07:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0B160E09;
	Fri,  7 Oct 2022 07:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0B160E09
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97C861BF392
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 07:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FEBA83F6D
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 07:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEBA83F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYj5tQax4UTH for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 07:35:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F1B83F68
Received: from mailproxy09.manitu.net (mailproxy09.manitu.net [217.11.48.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34F1B83F68
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 07:35:52 +0000 (UTC)
Received: from [IPV6:2001:a61:2571:e101:cb62:e29b:df1e:fe65] (unknown
 [IPv6:2001:a61:2571:e101:cb62:e29b:df1e:fe65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy09.manitu.net (Postfix) with ESMTPSA id 4EFE212000CB;
 Fri,  7 Oct 2022 09:35:49 +0200 (CEST)
Message-ID: <1d22bd7b-1136-6911-7181-81f2b24c5b00@grandegger.com>
Date: Fri, 7 Oct 2022 09:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <41db705a-2c63-47bc-3f03-d4c52d2a4b14@grandegger.com>
 <e6ddbdfb-7f8b-4eb2-e25d-24fe0c82e981@benettiengineering.com>
Content-Language: en-US
From: Wolfgang Grandegger <wg@grandegger.com>
In-Reply-To: <e6ddbdfb-7f8b-4eb2-e25d-24fe0c82e981@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/udisks: install to staging
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

I send trivial patches directly via email. Without "git send-email..." 
and I also didn't use "buildroot/get-developers". I just sent v2, hope 
it's fine now!?

 From my point of few it's a bug... but well, it doesn't really matter.

Wolfgang

On 06.10.22 22:14, Giulio Benetti wrote:
> Hi Wolgang,
>
> thanks for contributing!
>
> Something to deal with.
> Before 'git send-email...' do you use buildroot/get-developers script?
>
> I ask this because I'm not in Cc but I maintain this package as well as
> other 2 people.
>
> Il 06/10/2022 21:52, Wolfgang Grandegger ha scritto:
>> UDisks2 provides an Library API [1] for accessing the UDisks2 service 
>> via
>> "libudisks2.so". For development of UDisks2 clients, install to staging
>> as well! This issue has been reported as bug [2] as well.
>
> It doesn't make sense that this has been reported as a bug since it's
> not a bug but an adding. So please remove last sentence.
>
>> [1] http://storaged.org/doc/udisks2-api/2.9.4/ref-library.html[1]
>> [2] https://bugs.busybox.net/show_bug.cgi?id=15026
>
> And this line ^^^ too.
>
> Best regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
