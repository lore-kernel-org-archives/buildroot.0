Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71758C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 22:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2866F429E1;
	Sat, 11 Dec 2021 22:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmJgzbxkWM9d; Sat, 11 Dec 2021 22:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782E3429D5;
	Sat, 11 Dec 2021 22:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C006F1BF328
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 22:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF724013E
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 22:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ay42Bp4BQABA for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 22:37:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3627F400FD
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 22:37:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4E2F3240003;
 Sat, 11 Dec 2021 22:37:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwAzu-0005qH-Mt; Sat, 11 Dec 2021 23:37:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211126171804.920644-1-fontaine.fabrice@gmail.com>
Date: Sat, 11 Dec 2021 23:37:42 +0100
In-Reply-To: <20211126171804.920644-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 26 Nov 2021 18:18:04 +0100")
Message-ID: <87fsqy3gzt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/wireshark: security bump to version 3.4.10
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
 > - https://www.wireshark.org/security/wnpa-sec-2021-07.html
 >   (CVE-2021-39929)
 > - https://www.wireshark.org/security/wnpa-sec-2021-08.html
 >   (CVE-2021-39926)
 > - https://www.wireshark.org/security/wnpa-sec-2021-09.html
 >   (CVE-2021-39925)
 > - https://www.wireshark.org/security/wnpa-sec-2021-10.html
 >   (CVE-2021-39924)
 > - https://www.wireshark.org/security/wnpa-sec-2021-11.html
 > - https://www.wireshark.org/security/wnpa-sec-2021-12.html
 >   (CVE-2021-39922)
 > - https://www.wireshark.org/security/wnpa-sec-2021-13.html
 >   (CVE-2021-39928)
 > - https://www.wireshark.org/security/wnpa-sec-2021-14.html
 >   (CVE-2021-39921)
 > - https://www.wireshark.org/security/wnpa-sec-2021-15.html
 >   (CVE-2021-39920)

 > Drop WIRESHARK_BUILD_LEMON_TOOL and set LEMON_C_COMPILER which is
 > available since
 > https://gitlab.com/wireshark/wireshark/-/commit/61e66c37abb1b7f59726e4407ac8dd53e6b75cac

 > https://www.wireshark.org/docs/relnotes/wireshark-3.4.10.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Add patch

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
