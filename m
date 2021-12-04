Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF77C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D370A83449;
	Sat,  4 Dec 2021 22:11:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fmyPRFZmZC7Q; Sat,  4 Dec 2021 22:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C98583365;
	Sat,  4 Dec 2021 22:11:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7173E1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 616A2410B5
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nsd6Q7eibyVy for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:10:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43EDD408D9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:10:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 43711240002;
 Sat,  4 Dec 2021 22:10:10 +0000 (UTC)
Date: Sat, 4 Dec 2021 23:10:09 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211204231009.549a087d@windsurf>
In-Reply-To: <20211123202847.3801497-1-fontaine.fabrice@gmail.com>
References: <20211123202847.3801497-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/taglib: bump to version
 1.12
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Nov 2021 21:28:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - Update indentation in hash file (two spaces)
> 
> https://github.com/taglib/taglib/releases/tag/v1.12
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-config-file-for-cross-compiling-906.patch | 66 -------------------
>  ...-instance-of-TextIdentificationFrame.patch | 33 ----------
>  ...d-when-loading-invalid-ogg-flac-file.patch | 45 -------------
>  package/taglib/taglib.hash                    |  6 +-
>  package/taglib/taglib.mk                      |  8 +--
>  5 files changed, 4 insertions(+), 154 deletions(-)
>  delete mode 100644 package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch
>  delete mode 100644 package/taglib/0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
>  delete mode 100644 package/taglib/0003-Fixed-OOB-read-when-loading-invalid-ogg-flac-file.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
