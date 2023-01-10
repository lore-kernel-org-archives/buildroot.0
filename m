Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A24C46467
	for <buildroot@archiver.kernel.org>; Tue, 10 Jan 2023 18:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785C7403C4;
	Tue, 10 Jan 2023 18:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785C7403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jfLt81HyVzzs; Tue, 10 Jan 2023 18:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0B78402A8;
	Tue, 10 Jan 2023 18:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0B78402A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E69EE1BF5DD
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 18:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0DCB402A8
 for <buildroot@lists.busybox.net>; Tue, 10 Jan 2023 18:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0DCB402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xijLj5Y1mZU for <buildroot@lists.busybox.net>;
 Tue, 10 Jan 2023 18:27:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 363BC4016F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 363BC4016F
 for <buildroot@buildroot.org>; Tue, 10 Jan 2023 18:27:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 15F9140008;
 Tue, 10 Jan 2023 18:27:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pFJLT-00GqOc-2K; Tue, 10 Jan 2023 19:27:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230104073630.654488-1-thomas.devoogdt@barco.com>
Date: Tue, 10 Jan 2023 19:27:35 +0100
In-Reply-To: <20230104073630.654488-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Wed, 4 Jan 2023 08:36:30 +0100")
Message-ID: <87zgaqkzxk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.38.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Bugfix release, with a security patch for
 > CVE-2022-42799, CVE-2022-42823, CVE-2022-42824, CVE-2022-42852,
 > CVE-2022-42856, CVE-2022-42863, CVE-2022-42867, CVE-2022-46691,
 > CVE-2022-46692, CVE-2022-46698, CVE-2022-46699 and CVE-2022-46700.

 > Release notes:

 >  https://webkitgtk.org/2022/10/20/webkitgtk2.38.1-released.html
 >  https://webkitgtk.org/2022/11/04/webkitgtk2.38.2-released.html
 >  https://webkitgtk.org/2022/12/22/webkitgtk2.38.3-released.html

 > Accompanying security advisory:

 >  https://webkitgtk.org/security/WSA-2022-0010.html
 >  https://webkitgtk.org/security/WSA-2022-0011.html

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Committed to 2022.11.x, thanks.

Backporting it to 2022.02.x is a bit icky as it needs cmake 3.20+. Given
how close we are to marking 2022.02.x EOL, I think I will just skip it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
