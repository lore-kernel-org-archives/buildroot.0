Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0C6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 11:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B60A4427CD;
	Sun, 12 Dec 2021 11:50:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7hgQLOlwVyn; Sun, 12 Dec 2021 11:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B311427CA;
	Sun, 12 Dec 2021 11:50:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06F2A1BF393
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 11:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5DF840233
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 11:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTP-p0rF5od2 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 11:49:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86142400DE
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 11:49:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7C3676000F;
 Sun, 12 Dec 2021 11:49:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mwNMR-0001Jb-MO; Sun, 12 Dec 2021 12:49:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211019172532.3431240-1-fontaine.fabrice@gmail.com>
 <20211019172532.3431240-3-fontaine.fabrice@gmail.com>
Date: Sun, 12 Dec 2021 12:49:47 +0100
In-Reply-To: <20211019172532.3431240-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Oct 2021 19:25:32 +0200")
Message-ID: <8735my11r8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/samba4: drop third patch
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

 > Drop third patch as it is not needed when using compile_et from heimdal
 > instead of compile_et from e2fprogs as spotted by upstream in:
 > https://bugzilla.samba.org/show_bug.cgi?id=13856#c20

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
