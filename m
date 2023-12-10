Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080EDC4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 22:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9112F81AF3;
	Sun, 10 Dec 2023 22:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9112F81AF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o58GNgPmnvrm; Sun, 10 Dec 2023 22:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0883781AEA;
	Sun, 10 Dec 2023 22:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0883781AEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 425811BF316
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 22:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 149F060F05
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 22:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 149F060F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCPO7hKF23dd for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 22:51:32 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A81860888
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 22:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A81860888
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7449C0003
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 22:51:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rCSe1-002cmL-0M
 for buildroot@buildroot.org; Sun, 10 Dec 2023 23:51:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <87y1e7sq4u.fsf@48ers.dk>
Date: Sun, 10 Dec 2023 23:51:29 +0100
In-Reply-To: <87y1e7sq4u.fsf@48ers.dk> (Peter Korsgaard's message of "Wed, 06
 Dec 2023 09:15:45 +0100")
Message-ID: <87fs09oemm.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Talos security vulnerabilities TALOS-2023-1844 /
 TALOS-2023-1845
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hello,

 > Hash files for riscv64-elf-toolchain and mxsldr were added by:

 > https://gitlab.com/buildroot.org/buildroot/-/commit/58d7c712d7d1ef5b439ead455a4ed2ca659b60fb

Sorry, wrong commit. The correct one is:

https://gitlab.com/buildroot.org/buildroot/-/commit/cf2dcaa1ecede670a0bc54841652a0e3bea5c744

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
