Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD37CC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E627424A8;
	Fri,  7 Jan 2022 20:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRXVfcwLM_cX; Fri,  7 Jan 2022 20:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0526404C5;
	Fri,  7 Jan 2022 20:39:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 723E01BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61130429A2
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onoSGpLv9jFv for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:39:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 734CF4299F
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:39:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AA7D960003;
 Fri,  7 Jan 2022 20:39:34 +0000 (UTC)
Date: Fri, 7 Jan 2022 21:39:33 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220107213933.506bab07@windsurf>
In-Reply-To: <20220107195605.1411244-1-fontaine.fabrice@gmail.com>
References: <20220107195605.1411244-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: bump to version 2.0.6
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

On Fri,  7 Jan 2022 20:56:05 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> RISC-V is supported since
> https://github.com/zlib-ng/zlib-ng/commit/81f1c8a41bd1427707f402450de8820816760fca
> 
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.6
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.5
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.4
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.3
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.2
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.1
> https://github.com/zlib-ng/zlib-ng/releases/tag/2.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zlib-ng/zlib-ng.hash | 2 +-
>  package/zlib-ng/zlib-ng.mk   | 2 +-
>  package/zlib/Config.in       | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
