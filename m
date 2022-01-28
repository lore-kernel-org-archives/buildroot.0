Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B62FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 20:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE5AD4014C;
	Fri, 28 Jan 2022 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gj888jTnTxwD; Fri, 28 Jan 2022 20:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9EDA40253;
	Fri, 28 Jan 2022 20:41:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B35681BF842
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF15160D4D
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 20:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FyT23RksFjh8 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 20:41:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 401FC60C2F
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 20:41:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E918B60005;
 Fri, 28 Jan 2022 20:41:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nDY3m-0003t2-BG; Fri, 28 Jan 2022 21:41:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220123194537.DE43C82B40@busybox.osuosl.org>
Date: Fri, 28 Jan 2022 21:41:30 +0100
In-Reply-To: <20220123194537.DE43C82B40@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 23 Jan 2022 20:49:34 +0100")
Message-ID: <87czkb61ad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libpjsip: security bump to
 version 2.11.1
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=2c7ad667ec4a25226848baba809e492ca0ff06da
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Security update. This version is recommended for all users to improve
 > the security of applications using PJSIP.

 > Fix CVE-2020-15260, CVE-2021-21375 and CVE-2021-32686

 > Update indentation in hash file (two spaces)

 > https://github.com/pjsip/pjproject/security/advisories/GHSA-8hcp-hm38-mfph
 > https://github.com/pjsip/pjproject/security/advisories/GHSA-hvq6-f89p-frvp
 > https://github.com/pjsip/pjproject/security/advisories/GHSA-cv8x-p47p-99wr
 > https://github.com/pjsip/pjproject/releases/tag/2.11
 > https://github.com/pjsip/pjproject/releases/tag/2.11.1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
