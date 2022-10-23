Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE7ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 18:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 114BC4054A;
	Sun, 23 Oct 2022 18:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114BC4054A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dgB3RlBPwLW1; Sun, 23 Oct 2022 18:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3835404EB;
	Sun, 23 Oct 2022 18:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3835404EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17E341BF308
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0076B40399
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0076B40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJqCJvis_Q8B for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 18:55:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3BBD40363
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3BBD40363
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 18:55:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71D552000A;
 Sun, 23 Oct 2022 18:55:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1omg7s-00Cc4r-Ex; Sun, 23 Oct 2022 20:55:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221022202857.128289-1-fontaine.fabrice@gmail.com>
Date: Sun, 23 Oct 2022 20:55:12 +0200
In-Reply-To: <20221022202857.128289-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 22 Oct 2022 22:28:57 +0200")
Message-ID: <877d0q2wvj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: bump to version 1.1.2
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > https://github.com/USBGuard/usbguard/blob/usbguard-1.1.2/CHANGELOG.md
 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
