Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E93C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 11:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE43C40613;
	Wed,  4 Jan 2023 11:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE43C40613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dElEyaI-1otv; Wed,  4 Jan 2023 11:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E59E8403F9;
	Wed,  4 Jan 2023 11:26:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59E8403F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 563551BF2F9
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31EC3608D8
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 11:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31EC3608D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZlPyuC6mqAe for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 11:26:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8583600C5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8583600C5
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 11:26:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1BBEA1BF211;
 Wed,  4 Jan 2023 11:26:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pD1un-004X8X-15; Wed, 04 Jan 2023 12:26:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20221229194729.8085-1-ju.o@free.fr>
 <20221229194729.8085-2-ju.o@free.fr>
Date: Wed, 04 Jan 2023 12:26:36 +0100
In-Reply-To: <20221229194729.8085-2-ju.o@free.fr> (Julien Olivain's message of
 "Thu, 29 Dec 2022 20:47:04 +0100")
Message-ID: <87k0227d77.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 02/27] package/fmc: update codeaurora URLs
 to github
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

 > This commit also:
 > - changes the _SITE_METHOD from "git" to the default "wget",
 > - updates an old and broken freescale.com app note link,
 > - adds the github project page as project url.

 > Note: this commit does not change the component version. Only the
 > download URL is updated. The archive content is expected to be the
 > same. The version "fsl-sdk-v2.0" is an old tag from 2015. It was not
 > migrated to github. This commit use instead the commit id
 > corresponding to this tag.

 > See:
 > https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/fmc/commit/?h=fsl-sdk-v2.0&id=a079d2c844edd85dff85a317a63198e7988bcd09

 > The commit id exists on github:
 > https://github.com/nxp-qoriq/fmc/commit/a079d2c844edd85dff85a317a63198e7988bcd09

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
