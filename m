Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD937C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 16:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD6E6085F;
	Tue,  7 May 2024 16:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FTmWLzHc-rg; Tue,  7 May 2024 16:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B19F60A91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B19F60A91;
	Tue,  7 May 2024 16:07:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC861BF591
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28F00404A0
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 16:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCf457HMDlVf for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 16:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E57C94043F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E57C94043F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E57C94043F
 for <buildroot@buildroot.org>; Tue,  7 May 2024 16:06:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA5561C0002;
 Tue,  7 May 2024 16:06:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4NLD-004iUQ-0N;
 Tue, 07 May 2024 18:06:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
Date: Tue, 07 May 2024 18:06:55 +0200
In-Reply-To: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sun, 14 Apr 2024 15:05:18 +0200")
Message-ID: <87msp1wqqo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/3] package/bmap-tools: update GitHub URL
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
Cc: linux-amarula@amarulasolutions.com, "Yann E .
 Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > As reported in the README file of the old GitHub URL (i.e.
 > https://github.com/intel/bmap-tools), "The code at this location is no
 > longer maintained and will likely be removed in the future. This project
 > has moved to https://github.com/yoctoproject/bmaptool".

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 >  package/bmap-tools/Config.in      | 2 +-
 >  package/bmap-tools/Config.in.host | 2 +-
 >  package/bmap-tools/bmap-tools.mk  | 2 +-
 >  3 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
 > index 91081069c739..425b7dfb9e07 100644
 > --- a/package/bmap-tools/Config.in
 > +++ b/package/bmap-tools/Config.in
 > @@ -40,4 +40,4 @@ config BR2_PACKAGE_BMAP_TOOLS
 >  	  python-gpgme is not available. Optimized bzip2 decompression
 >  	  is not supported as pbzip2 is not available.
 
 > -	  https://github.com/intel/bmap-tools
 > +	  https://github.com/yoctoproject/bmaptool
 > diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
 > index a20829030d68..cb4d35a437fa 100644
 > --- a/package/bmap-tools/Config.in.host
 > +++ b/package/bmap-tools/Config.in.host
 > @@ -9,4 +9,4 @@ config BR2_PACKAGE_HOST_BMAP_TOOLS
 >  	  image files, can be copied or flashed a lot faster with
 >  	  bmaptool than with traditional tools like "dd" or "cp".
 
 > -	  https://github.com/intel/bmap-tools
 > +	  https://github.com/yoctoproject/bmaptool
 > diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
 > index 32399ca151c4..69a22c4745ab 100644
 > --- a/package/bmap-tools/bmap-tools.mk
 > +++ b/package/bmap-tools/bmap-tools.mk
 > @@ -5,7 +5,7 @@
 >  ################################################################################
 
 >  BMAP_TOOLS_VERSION = 3.6
 > -BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
 > +BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))

I wanted to apply this to 2024.02.x, but this change of repo changes the
hash of the tarball (I guess the name of the toplevel directory
changed):

ERROR: while checking hashes from package/bmap-tools//bmap-tools.hash
ERROR: bmap-tools-3.6.tar.gz has wrong sha256 hash:
ERROR: expected: 0658afb972e7221aa16fece3f84e29e5102e901c929253d7fb6040bde28243f7
ERROR: got     : 7a2e1305bf7e06bc4a580cc719f0facf9d99af8d41659b57c0acae4ad93ff45a
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
