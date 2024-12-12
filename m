Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E4CE77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 11:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B08C606A5;
	Thu, 12 Dec 2024 11:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u59PUXWH82Cm; Thu, 12 Dec 2024 11:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A1661324
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A1661324;
	Thu, 12 Dec 2024 11:58:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 398D3113C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3486841411
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxI7GSTOXHGH for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 11:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0AB1407CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0AB1407CB
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0AB1407CB
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 11:58:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C2501C0002;
 Thu, 12 Dec 2024 11:58:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tLhpv-002tCU-1b;
 Thu, 12 Dec 2024 12:58:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
References: <20241211120151.3982111-2-buildroot@heine.tech>
Date: Thu, 12 Dec 2024 12:58:31 +0100
In-Reply-To: <20241211120151.3982111-2-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Wed, 11 Dec 2024 13:01:29 +0100")
Message-ID: <87h679w1so.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sdbus-cpp: bump to version 2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

You forgot to add your signed-off-by, so I cannot apply this. Can you
please send a v2 with that fixed?

 > ---
 >  package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 >  package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
 > index 1350fc6781..1160f3f2bb 100644
 > --- a/package/sdbus-cpp/sdbus-cpp.hash
 > +++ b/package/sdbus-cpp/sdbus-cpp.hash
 > @@ -1,4 +1,4 @@
 >  # Locally computed:
 > -sha256  88af4569161a0d0192f0f4a94582a1af4e75722499d06984fb7f91f638f5afb3  sdbus-cpp-2.0.0.tar.gz
 > +sha256  6025e5dc6cddd532ff960d14e68ced5f42a1916b23a73fea6bcb437f06992eaf  sdbus-cpp-2.1.0.tar.gz
 >  sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 >  sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
 > diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
 > index 2994f079c9..a01bcd22c6 100644
 > --- a/package/sdbus-cpp/sdbus-cpp.mk
 > +++ b/package/sdbus-cpp/sdbus-cpp.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SDBUS_CPP_VERSION = 2.0.0
 > +SDBUS_CPP_VERSION = 2.1.0
 >  SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 >  SDBUS_CPP_INSTALL_STAGING = YES
 >  SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
 > -- 

 > 2.43.0

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
