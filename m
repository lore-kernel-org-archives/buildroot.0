Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C54AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 10:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D396461322;
	Wed, 13 Jul 2022 10:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D396461322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hlP9qpokJpQx; Wed, 13 Jul 2022 10:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F3561148;
	Wed, 13 Jul 2022 10:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F3561148
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CCFF1BF484
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37D6E60B4F
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 10:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37D6E60B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MuU7R2IejeNM for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 10:55:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D136A61322
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D136A61322
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 10:55:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8637200008;
 Wed, 13 Jul 2022 10:55:03 +0000 (UTC)
Message-ID: <ddb4b2d3-5518-2500-79ca-f1776856dca2@korsgaard.com>
Date: Wed, 13 Jul 2022 12:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611121614.1172869-1-bernd.kuhls@t-online.de>
 <20220611121614.1172869-2-bernd.kuhls@t-online.de>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220611121614.1172869-2-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 2/3] package/apache: security bump version
 to 2.4.54
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
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.54
> 
> Fixes CVE-2022-26377, CVE-2022-28330, CVE-2022-28614, CVE-2022-28615,
> CVE-2022-29404, CVE-2022-30522, CVE-2022-30556 and CVE-2022-31813.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2022.02.x and 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
