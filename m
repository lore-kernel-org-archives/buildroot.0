Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 924834176E;
	Wed,  4 Jan 2023 11:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 924834176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WL3cFful9uCq; Wed,  4 Jan 2023 11:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F3B341808;
	Wed,  4 Jan 2023 11:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F3B341808
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 511EE1BF2F9
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C21F608D8
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C21F608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnXaS9t-offm for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:26:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A574C600C5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A574C600C5
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:26:31 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E336BE000E;
 Wed,  4 Jan 2023 11:26:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pD1ub-004X8F-4M; Wed, 04 Jan 2023 12:26:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
Date: Wed, 04 Jan 2023 12:26:25 +0100
In-Reply-To: <20221229194729.8085-1-ju.o@free.fr> (Julien Olivain's message of
 "Thu, 29 Dec 2022 20:47:03 +0100")
Message-ID: <87o7re7d7i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 01/27] package/imx-mkimage: update
 codeaurora URLs to github
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Gilles Talis <gilles.talis@gmail.com>, Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>, buildroot@buildroot.org,
 Fabio Estevam <festevam@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > NXP moved all its open source code repositories from Code Aurora Forum
 > to github. See for example:
 > https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097

 > Software packages are now grouped in several NXP github
 > projects/organizations (nxp-imx, nxp-qoriq, ...). See:
 > https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB

 > The NXP code published on Code Aurora is still present (at the time of
 > this commit) but is no longer receiving updates. It is also expected
 > to be shut down on 2023-03-31. The Code Aurora website
 > https://source.codeaurora.org/ currently show the following message:
 > """
 > Note: Qualcomm Innovation Center Inc. maintained repositories have
 > migrated to git.codelinaro.org. QUIC repositories on this site will
 > not receive any updates after March 31, 2022, and will be deleted on
 > March 31, 2023. If your project depends on these repositories, please
 > adjust your tooling configuration to use the new, up-to-date project
 > location.
 > """

 > For this reason, the NXP recipes using codeaurora.org urls need to be
 > updated to the correct github.com replacement.

 > Note: this commit does not change the component version. Only the
 > download URL is updated. The archive content is expected to be the
 > same.

 > Note 2: the _SITE_METHOD is also changed from "git" to the default
 > "wget", for faster downloads. This is why the package hash has
 > changed.

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2022.11.x, thanks (different version in 2022.02.x).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
