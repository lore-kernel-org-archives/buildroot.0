Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81A7C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226566F4B1;
	Thu, 30 Nov 2023 08:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 226566F4B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TyzhtXTQrNm; Thu, 30 Nov 2023 08:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B90961B3A;
	Thu, 30 Nov 2023 08:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B90961B3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 591611BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 369BD8133C
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369BD8133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvkZ3G8Hj_my for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:25:35 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BE3781307
 for <buildroot@uclibc.org>; Thu, 30 Nov 2023 08:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE3781307
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 45EA2C7000
 for <buildroot@uclibc.org>; Thu, 30 Nov 2023 08:14:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF5FD1BF211;
 Thu, 30 Nov 2023 08:14:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8cBW-002JYo-0S;
 Thu, 30 Nov 2023 09:14:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20231016180855.69848-1-bernd@kuhls.net>
 <20231101223659.3daf8e1a@windsurf>
 <8734xgtp1w.fsf__14670.3781488881$1699446027$gmane$org@48ers.dk>
 <pan$c6447$9e02fed2$b5658855$c64dce11@ID-313208.user.individual.net>
Date: Thu, 30 Nov 2023 09:14:10 +0100
In-Reply-To: <pan$c6447$9e02fed2$b5658855$c64dce11@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Wed, 29 Nov 2023 22:26:28 +0100")
Message-ID: <87y1ef8xpp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.19.2
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Am Wed, 08 Nov 2023 13:19:55 +0100 schrieb Peter Korsgaard:
 >> From the looks of it, this only affects 4.19.x and not the 4.18.8 we
 >> have in 2023.02.x / 2023.08.x, right?

 > Hi Peter,

 > sorry for answering late, but yes, I think you are right:
 > https://ubuntu.com/security/CVE-2023-5568
 > "appears to be 4.19 only"

Ok, good.

 > But 4.18.9 is out now which fixes CVE-2018-14628
 > https://www.samba.org/samba/history/samba-4.18.9.html

Ok, will you send a bump for that?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
