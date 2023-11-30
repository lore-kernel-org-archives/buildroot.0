Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0ADC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 555CC6F4B5;
	Thu, 30 Nov 2023 08:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 555CC6F4B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25xFklTw3gsZ; Thu, 30 Nov 2023 08:27:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEFD061B3A;
	Thu, 30 Nov 2023 08:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEFD061B3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8F71BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07F146F4A8
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07F146F4A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3C0o7nhU8Uz3 for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:27:24 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1752361B39
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1752361B39
Received: by mail.gandi.net (Postfix) with ESMTPSA id 578C0240005;
 Thu, 30 Nov 2023 08:27:21 +0000 (UTC)
Message-ID: <8e4a0378-31d1-4e3a-8404-b990f22f5556@korsgaard.com>
Date: Thu, 30 Nov 2023 09:27:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
References: <20231123061500.984461-1-fido_max@inbox.ru>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231123061500.984461-1-fido_max@inbox.ru>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 15.5
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

On 23/11/2023 07.15, Maxim Kochetkov wrote:
> Release notes:
> https://www.postgresql.org/about/news/postgresql-161-155-1410-1313-1217-and-1122-released-2749/
> 
> Fixes CVE-2023-5868, CVE-2023-5869, CVE-2023-5870.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
