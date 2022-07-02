Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6179C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3887961036;
	Sat,  2 Jul 2022 13:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3887961036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6x769_NTxVX; Sat,  2 Jul 2022 13:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 284A760BD2;
	Sat,  2 Jul 2022 13:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 284A760BD2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 233081BF5A1
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2599409E9
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2599409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0h0eJjT-UuM for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:51:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 924CC41061
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 924CC41061
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:51:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 535C9240005;
 Sat,  2 Jul 2022 13:51:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o7dWp-00GDVF-DJ; Sat, 02 Jul 2022 15:51:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220629120445.2341504-1-james.hilliard1@gmail.com>
Date: Sat, 02 Jul 2022 15:51:19 +0200
In-Reply-To: <20220629120445.2341504-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Wed, 29 Jun 2022 06:04:45 -0600")
Message-ID: <87fsjj62so.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to
 version 2.4.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Committed to 2022.05.x, thanks.

> ---
 >  package/python-cssutils/python-cssutils.hash | 4 ++--
 >  package/python-cssutils/python-cssutils.mk   | 4 ++--
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/python-cssutils/python-cssutils.hash b/package/python-cssutils/python-cssutils.hash
 > index 13459f7270..065c8ac1f3 100644
 > --- a/package/python-cssutils/python-cssutils.hash
 > +++ b/package/python-cssutils/python-cssutils.hash
 > @@ -1,5 +1,5 @@
 >  # md5, sha256 from https://pypi.org/pypi/cssutils/json
 > -md5  4ae0e6c670483043260363f593e96a69  cssutils-2.4.0.tar.gz
 > -sha256  2d97210a83b0a3fe1e4469f5ff9a6420b078572035188b1bab7103c3a36dc89b  cssutils-2.4.0.tar.gz
 > +md5  3b9acf80a22c44d2d12eb7e20533934a  cssutils-2.4.2.tar.gz
 > +sha256  877818bfa9668cc535773f46e6b6a46de28436191211741b3f7b4aaa64d9afbb  cssutils-2.4.2.tar.gz
 >  # Locally computed sha256 checksums
 >  sha256  03c570a068086ee577dcd795519ea93462b2ed2fcb6dcc4dfce56a71a2fd6e5a  COPYING.LESSER
 > diff --git a/package/python-cssutils/python-cssutils.mk b/package/python-cssutils/python-cssutils.mk
 > index fc65c893ac..beb5f1c8ff 100644
 > --- a/package/python-cssutils/python-cssutils.mk
 > +++ b/package/python-cssutils/python-cssutils.mk
 > @@ -4,9 +4,9 @@
 >  #
 >  ################################################################################
 
 > -PYTHON_CSSUTILS_VERSION = 2.4.0
 > +PYTHON_CSSUTILS_VERSION = 2.4.2
 >  PYTHON_CSSUTILS_SOURCE = cssutils-$(PYTHON_CSSUTILS_VERSION).tar.gz
 > -PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/f4/ea/d09b04b5cf6ad84f45ca4c523d3e153dd9be1f12650c825d1c92ca0618a2
 > +PYTHON_CSSUTILS_SITE = https://files.pythonhosted.org/packages/d4/12/1aba9a6c91d92de011ff97a9320ad37e5565adfe0cc324deee58d5891d7a
 >  PYTHON_CSSUTILS_LICENSE = LGPL-3.0+
 >  PYTHON_CSSUTILS_LICENSE_FILES = COPYING.LESSER
 >  PYTHON_CSSUTILS_SETUP_TYPE = setuptools
 > -- 

 > 2.34.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
