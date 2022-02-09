Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E290C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 03:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE35414CE;
	Wed,  9 Feb 2022 03:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upW3cmOqkGB3; Wed,  9 Feb 2022 03:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00C941499;
	Wed,  9 Feb 2022 03:57:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADB451BF325
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 03:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9098541499
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 03:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ESZzDQgTou8j for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 03:57:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DEEA41487
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 03:57:21 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 2193uept080064;
 Wed, 9 Feb 2022 11:56:40 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 9 Feb 2022 11:56:39 +0800
Date: Wed, 9 Feb 2022 11:55:52 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <thomas.petazzoni@bootlin.com>
Message-ID: <YgM7SDj7OxQiOfKt@APC323>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 2193uept080064
Subject: [Buildroot] Patch state of andes/ae350
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

I would like to follow up on my patches last month.
Are they still under review? Please let me know if
I missed something that needs to be fixed.

Regards,
Yu-Chien Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
