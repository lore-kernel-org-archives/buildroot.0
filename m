Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0269EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968604166A;
	Mon, 24 Jan 2022 21:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-EuRrROG1JA; Mon, 24 Jan 2022 21:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D669F41667;
	Mon, 24 Jan 2022 21:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADEC41BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 946FE83E09
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTheMTc8mPGv for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:11:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BCB68317B
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:11:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7F42BC09F5
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:02:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 863251C0005;
 Mon, 24 Jan 2022 21:02:52 +0000 (UTC)
Date: Mon, 24 Jan 2022 22:02:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220124220251.65336d07@windsurf>
In-Reply-To: <20220123212757.781999-1-fontaine.fabrice@gmail.com>
References: <20220123212757.781999-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xml-security-c: bump to version
 2.0.4
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 23 Jan 2022 22:27:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Version 2.0.4 of the Apache XML Security for C++ has been released,
> correcting support for OpenSSL earlier than 1.1.
> 
> Version 2.0.3 of the Apache XML Security for C++ has been released,
> adding support for OpenSSL 3.0.0.
> 
> Drop patch (already in version) and so autoreconf
> 
> https://santuario.apache.org/cindex.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ariable-cache-option-for-getcwd-test.patch | 50 -------------------
>  package/xml-security-c/xml-security-c.hash    |  4 +-
>  package/xml-security-c/xml-security-c.mk      |  5 +-
>  3 files changed, 3 insertions(+), 56 deletions(-)
>  delete mode 100644 package/xml-security-c/0001-autoconf-variable-cache-option-for-getcwd-test.patch

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
