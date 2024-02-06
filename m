Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C630C48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC95A41DE8;
	Tue,  6 Feb 2024 08:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC95A41DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75GhE2kOxquz; Tue,  6 Feb 2024 08:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0471B41DE4;
	Tue,  6 Feb 2024 08:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0471B41DE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECB131BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D24C241DE8
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D24C241DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id neS-0Qr8q-Rw for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:15:12 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9100A41DE4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9100A41DE4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D5BFE0010;
 Tue,  6 Feb 2024 08:15:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXGbk-00DKbO-2h;
 Tue, 06 Feb 2024 09:15:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240205201342.2995-1-fontaine.fabrice@gmail.com>
Date: Tue, 06 Feb 2024 09:15:08 +0100
In-Reply-To: <20240205201342.2995-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 5 Feb 2024 21:13:42 +0100")
Message-ID: <87cyta80vn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gesftpserver: update
 GESFTPSERVER_CPE_ID_VENDOR
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cpe:2.3:a:green_end:sftpserver has been deprecated in favor of
 > cpe:2.3:a:greenend:sftpserver in December 2022:

 >  <cpe-item name="cpe:/a:green_end:sftpserver:0.2.2" deprecated="true" deprecation_date="2022-12-30T17:53:22.797Z">
 >       <reference href="https://github.com/ewxrjk/sftpserver/releases">Version</reference>
 >       <reference href="http://www.greenend.org.uk/rjk/sftpserver/">Product</reference>
 >     <cpe-23:cpe23-item name="cpe:2.3:a:green_end:sftpserver:0.2.2:*:*:*:*:*:*:*">
 >         <cpe-23:deprecated-by name="cpe:2.3:a:greenend:sftpserver:0.2.2:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
