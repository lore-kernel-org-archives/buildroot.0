Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F026E82CC6
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B635442254;
	Wed, 27 Sep 2023 19:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B635442254
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JK_UZ6Hp1HOO; Wed, 27 Sep 2023 19:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD25E41DE1;
	Wed, 27 Sep 2023 19:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD25E41DE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16FA71BF300
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E45B6834C6
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E45B6834C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ontms1N1CHJn for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:02:18 +0000 (UTC)
X-Greylist: delayed 4493 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 27 Sep 2023 19:02:17 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F5E82C7C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F5E82C7C
 for <buildroot@busybox.net>; Wed, 27 Sep 2023 19:02:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CCDD0FF80A;
 Wed, 27 Sep 2023 19:02:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qlZna-005DKO-5G; Wed, 27 Sep 2023 21:02:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Fischer <mf@go-sys.de>
References: <20230927073600.17504-1-mf@go-sys.de>
Date: Wed, 27 Sep 2023 21:02:14 +0200
In-Reply-To: <20230927073600.17504-1-mf@go-sys.de> (Michael Fischer's message
 of "Wed, 27 Sep 2023 09:36:00 +0200")
Message-ID: <875y3v30eh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/gnuplot: bump version to 5.4.9
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Fischer <mf@go-sys.de> writes:

 > Changelog:
 > http://www.gnuplot.info/ReleaseNotes_5_4_9.html

 > Signed-off-by: Michael Fischer <mf@go-sys.de>
 > ---
 >  package/gnuplot/gnuplot.hash | 8 ++++----
 >  package/gnuplot/gnuplot.mk   | 5 +++--
 >  2 files changed, 7 insertions(+), 6 deletions(-)

 > diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
 > index 2f482ca434..6ed24b6d3c 100644
 > --- a/package/gnuplot/gnuplot.hash
 > +++ b/package/gnuplot/gnuplot.hash
 > @@ -1,6 +1,6 @@
 > -# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.7/
 > -md5  cdc9bb3ac0cc7e717246ed3df2d6ffa2  gnuplot-5.4.7.tar.gz
 > -sha1  6e68f94af822ff56549beab3a465c2fe976d3b34  gnuplot-5.4.7.tar.gz
 > +# From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.9/
 > +md5  345533e461e41c263b3293f46651f0b2  gnuplot-5.4.9.tar.gz
 > +sha1  1a3953660656a38178ae2b368efa895af55a5001  gnuplot-5.4.9.tar.gz
 >  # Locally computed
 > -sha256  318a1501c9e659f39cf05ee5268335671bddc6c20eae06851f262fde27c2e739  gnuplot-5.4.7.tar.gz
 > +sha256  a328a021f53dc05459be6066020e9a71e8eab6255d3381e22696120d465c6a97  gnuplot-5.4.9.tar.gz
 >  sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
 > diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
 > index 23fbae10a9..0cd37da7d6 100644
 > --- a/package/gnuplot/gnuplot.mk
 > +++ b/package/gnuplot/gnuplot.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -GNUPLOT_VERSION = 5.4.7
 > +GNUPLOT_VERSION = 5.4.9
 >  GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 >  GNUPLOT_LICENSE = gnuplot license (open source)
 >  GNUPLOT_LICENSE_FILES = Copyright
 > @@ -23,7 +23,8 @@ GNUPLOT_CONF_OPTS = \
 >  	--disable-wxwidgets \
 >  	--without-lua \
 >  	--without-latex \
 > -	--without-cairo
 > +	--without-cairo \
 > +	--with-qt=no

I've changed this to --without-qt instead for consistency with the other
options and applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
