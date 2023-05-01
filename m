Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A79AC77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D9961101;
	Mon,  1 May 2023 07:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D9961101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eu3_r0-juNCN; Mon,  1 May 2023 07:24:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1968610EE;
	Mon,  1 May 2023 07:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1968610EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CE4E1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74CE641796
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74CE641796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tp4cuw33lqS6 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:24:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330FC4177B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 330FC4177B
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:24:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F931E0003;
 Mon,  1 May 2023 07:24:05 +0000 (UTC)
Message-ID: <031dbdf8-0fcf-3516-7aea-edef37a5498d@korsgaard.com>
Date: Mon, 1 May 2023 09:24:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Buildroot Development <buildroot@buildroot.org>
References: <20230428090116.288124-1-bagasdotme@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230428090116.288124-1-bagasdotme@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/git: security bump to version 2.40.1
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

On 28/04/2023 11.01, Bagas Sanjaya wrote:
> Fix three CVEs (CVE-2023-25652, CVE-2023-25815, and CVE-2023-29007).
> For details on these, see release announcement at [1].
> 
> [1]: https://lore.kernel.org/git/xmqqa5yv3n93.fsf@gitster.g/
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
