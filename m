Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DC6C46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 19:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F7A4052D;
	Sat,  7 Jan 2023 19:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07F7A4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrQ6VfI7pBjf; Sat,  7 Jan 2023 19:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44A5A40142;
	Sat,  7 Jan 2023 19:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44A5A40142
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEF141BF421
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CACBA81FF1
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 19:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CACBA81FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VlizapIktRy7 for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 19:28:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEFCE81FEE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEFCE81FEE
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 19:28:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7350DC0002;
 Sat,  7 Jan 2023 19:28:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pEErI-00BBcE-GN; Sat, 07 Jan 2023 20:28:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20230106210417.29296-1-ps.report@gmx.net>
Date: Sat, 07 Jan 2023 20:28:00 +0100
In-Reply-To: <20230106210417.29296-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 6 Jan 2023 22:04:17 +0100")
Message-ID: <87cz7qm9fj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/ntpsec: bump version to 1.2.2
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - remove 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
 >   (upstream applied, see [1])

 > - rename 0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch
 >   to 0001-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch

 > - remove 0003-fix-build-with-libressl.patch
 >   (upstream applied, see [2])

 > - update license file list (change from LICENSE.adoc to LICENSES/BSD-2,
 >   LICENSES/BSD-3, LICENSES/CC-BY-4.0, LICENSES/MIT, LICENSES/NTP)

 > For details see [3].

 > [1] https://gitlab.com/NTPsec/ntpsec/-/commit/0bea0bef36ff9cfa3ff52de25a839c283cf46cf7
 > [2] https://gitlab.com/NTPsec/ntpsec/-/commit/128b66ae122d7b41ce4b99f427383fd6a5923d71
 > [3] https://gitlab.com/NTPsec/ntpsec/-/blob/master/NEWS.adoc

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > Fix package/ntpsec (renmae patch)

Dropped this line and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
