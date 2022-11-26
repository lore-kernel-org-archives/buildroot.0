Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE58DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F0C9416EC;
	Sat, 26 Nov 2022 18:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F0C9416EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6iatBkWqhyR; Sat, 26 Nov 2022 18:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B27D4167A;
	Sat, 26 Nov 2022 18:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B27D4167A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4258D1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27BC260E38
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BC260E38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqulKPkreVbY for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:23:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2505160E34
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2505160E34
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:22:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A04121BF205;
 Sat, 26 Nov 2022 18:22:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oyzpI-00021k-FD; Sat, 26 Nov 2022 19:22:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Miquel Raynal via buildroot <buildroot@buildroot.org>
References: <20221116084313.1068060-1-miquel.raynal@bootlin.com>
Date: Sat, 26 Nov 2022 19:22:56 +0100
In-Reply-To: <20221116084313.1068060-1-miquel.raynal@bootlin.com> (Miquel
 Raynal via buildroot's message of "Wed, 16 Nov 2022 09:43:13 +0100")
Message-ID: <87h6ylfudb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/mali-driver=3A_remove_?=
 =?utf-8?q?Miqu=C3=A8l__from_the_DEVELOPERS_list?=
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Miquel" == Miquel Raynal via buildroot <buildroot@buildroot.org> writes:

 > I am not really maintaining these packages, I don't follow closely
 > enough nor use them to take the time to make the necessary changes.
 > Giulio has been much more reactive than me to fix issues and he is
 > already listed for them anyway.

 > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
