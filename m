Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E38C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:13:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D723C60F70
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D723C60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C33880D99;
	Mon, 25 Oct 2021 12:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CUNKFIB13sQ; Mon, 25 Oct 2021 12:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2696680D6C;
	Mon, 25 Oct 2021 12:13:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEA601BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD6AC80D6C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8_jtLgeUCPH for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:13:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EA5C80D53
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:13:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id AA1CA100008;
 Mon, 25 Oct 2021 12:13:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1meyrB-0001Di-Im; Mon, 25 Oct 2021 14:13:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Matthew Weber via buildroot <buildroot@buildroot.org>
References: <20211018214014.1202-1-matthew.weber@collins.com>
Date: Mon, 25 Oct 2021 14:13:37 +0200
In-Reply-To: <20211018214014.1202-1-matthew.weber@collins.com> (Matthew Weber
 via buildroot's message of "Mon, 18 Oct 2021 16:40:13 -0500")
Message-ID: <87bl3dwbda.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/lightning: add
 LIGHTNING_CPE_ID_VENDOR
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
Cc: Matthew Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Matthew" == Matthew Weber via buildroot <buildroot@buildroot.org> writes:

 > cpe:2.3:a:gnu:lightning:*:*:*:*:*:*:*:* is a valid CPE for this pkg
 > https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alightning

 > Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
