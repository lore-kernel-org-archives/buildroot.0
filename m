Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84945C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E657D6111A;
	Mon,  1 May 2023 07:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E657D6111A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJxHKwx-EM5q; Mon,  1 May 2023 07:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D3E56115C;
	Mon,  1 May 2023 07:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3E56115C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB8BE1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E2F2416AF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2F2416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yECb7wLCNfen for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:16:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F40416AE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75F40416AE
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:16:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B5607240006;
 Mon,  1 May 2023 07:16:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptNlP-006WwT-U6; Mon, 01 May 2023 09:15:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230428131115.455670-1-bernd.kuhls@t-online.de>
Date: Mon, 01 May 2023 09:15:59 +0200
In-Reply-To: <20230428131115.455670-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 28 Apr 2023 15:11:15 +0200")
Message-ID: <87h6swldxs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.57
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://lists.apache.org/thread/lp9t6w2t0qsbbo14lylk2yvfj8hgfoh9

 > Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.57
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
