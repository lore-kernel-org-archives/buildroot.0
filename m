Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61094C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 09:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C6660E66;
	Tue, 16 Aug 2022 09:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C6660E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_bMBa4vPoLv; Tue, 16 Aug 2022 09:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E76E60E58;
	Tue, 16 Aug 2022 09:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E76E60E58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB1391BF39C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 862EC60E58
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 862EC60E58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BJPlsSLDQ1f for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 09:55:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 716CD60BDA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 716CD60BDA
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 09:55:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 237142000D;
 Tue, 16 Aug 2022 09:55:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oNtHs-001IYC-6T; Tue, 16 Aug 2022 11:55:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
References: <20220621135833.1148493-1-kory.maincent@bootlin.com>
Date: Tue, 16 Aug 2022 11:55:04 +0200
In-Reply-To: <20220621135833.1148493-1-kory.maincent@bootlin.com> (Kory
 Maincent via buildroot's message of "Tue, 21 Jun 2022 15:58:33 +0200")
Message-ID: <87zgg4cy2v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: remove extra
 ending parentheses
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
Cc: kory.maincent@bootlin.com, thomas.petazzoni@bootlin.com, geomatsi@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kory" == Kory Maincent via buildroot <buildroot@buildroot.org> writes:

 > From: Kory Maincent <kory.maincent@bootlin.com>
 > There are two extra ending parentheses to be removed.
 > They are present from the beggining of TF-A package. I suppose extra
 > ending parenthese does not bring any issue, but it seems relevant to
 > remove them.

 > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
