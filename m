Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7881C63705
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 09:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82399610EE;
	Thu,  8 Dec 2022 09:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82399610EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfCa6V-DLbPt; Thu,  8 Dec 2022 09:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA9761085;
	Thu,  8 Dec 2022 09:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA9761085
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1725E1BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 09:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E531A4184A
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 09:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E531A4184A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stOk6qGnpzqu for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 09:53:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 867164183B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 867164183B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 09:53:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CCF82000E;
 Thu,  8 Dec 2022 09:53:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p3DaT-0003NQ-Ax; Thu, 08 Dec 2022 10:53:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20221203211306.B892A85174@busybox.osuosl.org>
Date: Thu, 08 Dec 2022 10:53:05 +0100
In-Reply-To: <20221203211306.B892A85174@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 3 Dec 2022 22:11:38 +0100")
Message-ID: <87cz8u2pdq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package: optee-client: fix identation
 issues
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=b1c4c18766e51ee55e8d2e3a7cb12cb2762b12ff
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fix issues reported by utils/check-package:
 >     package/optee-client/S30optee:40: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
 >     package/optee-client/S30optee:46: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
 >     package/optee-client/S30optee:47: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
 >     package/optee-client/S30optee:48: should be indented with tabs (http://nightly.buildroot.org/#adding-packages-start-script)
 >     package/optee-client/S30optee:0: filename should be S<number><number><daemon name> (http://nightly.buildroot.org/#adding-packages-start-script)
 >     package/optee-client/S30tee-supplicant:0: run 'shellcheck' and fix the warnings

 > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
 > [yann.morin.1998@free.fr:
 >   - fix shellcheck SC2086
 >   - rename the file
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
