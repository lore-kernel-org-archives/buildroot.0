Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A1AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A0A408C6;
	Sun, 20 Mar 2022 17:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCPMyw4TIBfB; Sun, 20 Mar 2022 17:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 881E3408C1;
	Sun, 20 Mar 2022 17:46:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED9241BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9FF76068B
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4A9tj96CN2F for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:46:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E00CF60687
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:46:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC6A8100003;
 Sun, 20 Mar 2022 17:46:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVzdL-00FETE-Vp; Sun, 20 Mar 2022 18:46:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20220224162517.222437-1-romain.naour@gmail.com>
Date: Sun, 20 Mar 2022 18:46:27 +0100
In-Reply-To: <20220224162517.222437-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 24 Feb 2022 17:25:16 +0100")
Message-ID: <871qywple4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv2 1/2] package/efl: rework eeze handling in
 Kconfig
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Commit [1] added eeze dependency using "depends on" to several efl
 > options (drm, libmount) instead of selecting eeze and propagate the
 > udev reverse dependency.

 > [1] e026c3bdb8f493b3fc21de7c45e3edbc47e03128

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > v2: simplify the commit log
 >     Remove the "eeze" between parenthesis

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
