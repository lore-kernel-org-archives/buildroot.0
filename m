Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B341FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 12:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E8DA40AED;
	Fri, 28 Jan 2022 12:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YG1V7DgN6Fe2; Fri, 28 Jan 2022 12:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 559DF4092C;
	Fri, 28 Jan 2022 12:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20AD01BF332
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CA3F40AD8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 12:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 377ENiJHAu-8 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 12:46:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA623404D3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 12:46:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 930B3200003;
 Fri, 28 Jan 2022 12:46:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDQdx-00045c-Pt; Fri, 28 Jan 2022 13:46:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220114224035.1502100-1-fontaine.fabrice@gmail.com>
Date: Fri, 28 Jan 2022 13:46:21 +0100
In-Reply-To: <20220114224035.1502100-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 14 Jan 2022 23:40:35 +0100")
Message-ID: <87v8y481uq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.11
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following security issues:
 > - https://www.wireshark.org/security/wnpa-sec-2021-16.html
 >   (CVE-2021-4186)
 > - https://www.wireshark.org/security/wnpa-sec-2021-17.html
 >   (CVE-2021-4185)
 > - https://www.wireshark.org/security/wnpa-sec-2021-18.html
 >   (CVE-2021-4184)
 > - https://www.wireshark.org/security/wnpa-sec-2021-20.html
 >   (CVE-2021-4182)
 > - https://www.wireshark.org/security/wnpa-sec-2021-21.html
 >   (CVE-2021-4181)

 > https://www.wireshark.org/docs/relnotes/wireshark-3.4.11.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
