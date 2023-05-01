Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5C1C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50F88210C;
	Mon,  1 May 2023 07:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50F88210C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nk_Ideuqx0wm; Mon,  1 May 2023 07:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FFA7820CE;
	Mon,  1 May 2023 07:57:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FFA7820CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A415D1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C48D41578
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C48D41578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOJwtU8ycsGf for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:57:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39EAA41575
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39EAA41575
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:57:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82EC4100004;
 Mon,  1 May 2023 07:57:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptOPg-006cVC-NQ; Mon, 01 May 2023 09:57:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230428122633.683932-1-bagasdotme@gmail.com>
Date: Mon, 01 May 2023 09:57:36 +0200
In-Reply-To: <20230428122633.683932-1-bagasdotme@gmail.com> (Bagas Sanjaya's
 message of "Fri, 28 Apr 2023 19:26:33 +0700")
Message-ID: <87bkj4iivj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2023.02.x] package/git: security bump to
 version 2.39.3
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
Cc: Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bagas" == Bagas Sanjaya <bagasdotme@gmail.com> writes:

 > Fix three CVEs (CVE-2023-25652, CVE-2023-25815, and CVE-2023-29007).
 > For details on these, see release announcement at [1].

 > While at it, also drop two Buildroot patches as these have been
 > applied on upstream release branch.

 > [1]: https://lore.kernel.org/git/xmqqa5yv3n93.fsf@gitster.g/

 > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Committed to 2023.02.x, thanks.

I have added a similar commit bumping 2022.02.x to 2.31.8.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
