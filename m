Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35382C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCCE4409FF;
	Mon,  4 Apr 2022 12:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zg-0ahop6C7M; Mon,  4 Apr 2022 12:44:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7E90409F4;
	Mon,  4 Apr 2022 12:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8311BF3D1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D05F60692
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fEAgTTiMY36 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:44:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A2FA600C9
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:44:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50139100006;
 Mon,  4 Apr 2022 12:44:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbM4j-005slJ-Ed; Mon, 04 Apr 2022 14:44:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Markus Mayer via buildroot <buildroot@buildroot.org>
References: <20220401215653.1703616-1-mmayer@broadcom.com>
Date: Mon, 04 Apr 2022 14:44:53 +0200
In-Reply-To: <20220401215653.1703616-1-mmayer@broadcom.com> (Markus Mayer via
 buildroot's message of "Fri, 1 Apr 2022 14:56:53 -0700")
Message-ID: <87mth1yq4a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package: replace git:// URLs with https://
 URLs where possible
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
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Markus" == Markus Mayer via buildroot <buildroot@buildroot.org> writes:

 > Replace the remaining git:// URLs with their https:// equivalents as
 > this is more secure and also more palatable to corporate firewalls.

 > This leaves package/dahdi-linux as the sole package still using a
 > git:// URL for cloning.

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
