Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67902C28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC8B183147;
	Wed, 26 Jan 2022 14:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qbh_Eh5i3ZYU; Wed, 26 Jan 2022 14:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 468CE83264;
	Wed, 26 Jan 2022 14:48:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD711BF577
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A88460F5C
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mdy-NbTIeeMW for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 14:48:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7799260797
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:48:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9871060011;
 Wed, 26 Jan 2022 14:48:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCjai-0006SW-JN; Wed, 26 Jan 2022 15:48:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220125070545.09FA6401E1@smtp2.osuosl.org>
 <78204a26-75d9-ef6a-bf7f-dee8b47fa508@benettiengineering.com>
Date: Wed, 26 Jan 2022 15:48:08 +0100
In-Reply-To: <78204a26-75d9-ef6a-bf7f-dee8b47fa508@benettiengineering.com>
 (Giulio Benetti's message of "Tue, 25 Jan 2022 08:09:07 +0100")
Message-ID: <87a6fih7tj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-01-24
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Hi Peter,
 > On 25/01/22 08:05, Thomas Petazzoni wrote:
 > [SNIP]

 >> Detail of failures for 2021.11.x
 >> --------------------------------
 >> 
 >> arch | reason | OK? | url | orph?
 >> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 >> microblazeel | libnss-3.73 | NOK |
 >> http://autobuild.buildroot.net/results/e02c7a0e22d8eee226e5c906537f7dfc559e067e
 >> |

 > This ^^^ is fixed by:
 > https://git.buildroot.net/buildroot/commit/?id=540029eb4550760c2190a18ecbf0cb4391bb1dea

Thanks for the heads up, applied to 2021.11.x

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
