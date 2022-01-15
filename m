Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A095C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311D482884;
	Sat, 15 Jan 2022 11:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TDh1VySTyDGT; Sat, 15 Jan 2022 11:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FDDE82882;
	Sat, 15 Jan 2022 11:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 707C11BF2E4
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BF1360A8F
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYjvYGPq8AH7 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:04:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01C1D60692
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:04:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55A86C0004;
 Sat, 15 Jan 2022 11:04:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8grC-00086j-IP; Sat, 15 Jan 2022 12:04:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211212192544.838696-1-fontaine.fabrice@gmail.com>
Date: Sat, 15 Jan 2022 12:04:26 +0100
In-Reply-To: <20211212192544.838696-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Dec 2021 20:25:44 +0100")
Message-ID: <87lezh45vp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.40
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version)
 > - This bump will fix build failures on ARM
 > - This bump will fix build failures with old glibc thanks to
 >   https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/e1671236671afbf7719b3ef29039ec4ac5102347

 > https://gitlab.freedesktop.org/pipewire/pipewire/-/tags/0.3.40

 > Fixes:
 >  - http://autobuild.buildroot.org/results/faec4ea02f4a6ddf44d54d5784d9de866c2d8a1f
 >  - http://autobuild.buildroot.org/results/31014558b6ad72e0f602095c423d48219dd6ebfa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
