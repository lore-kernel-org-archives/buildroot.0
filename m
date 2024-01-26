Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EACEC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 21:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD63C405D3;
	Fri, 26 Jan 2024 21:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD63C405D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GUfVqer6NbJb; Fri, 26 Jan 2024 21:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE578402C3;
	Fri, 26 Jan 2024 21:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE578402C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 667A51BF2EC
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F57761499
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 21:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F57761499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3vlPydAM6-r3 for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 21:29:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C72D60AAD
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 21:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C72D60AAD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C9360004;
 Fri, 26 Jan 2024 21:29:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTTlG-00ATBg-2C;
 Fri, 26 Jan 2024 22:29:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <Za5ALVSKp4U3Pa2Z@waldemar-brodkorb.de>
Date: Fri, 26 Jan 2024 22:29:18 +0100
In-Reply-To: <Za5ALVSKp4U3Pa2Z@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Mon, 22 Jan 2024 11:15:09 +0100")
Message-ID: <87il3f2381.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/ruby: bump to 3.3.0
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > See here for changes:
 > https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/

 > Patch applied upstream.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

make ruby-legal-info
..
>>> ruby 3.3.0 Collecting legal info
ERROR: while checking hashes from package/ruby//ruby.hash
ERROR: LEGAL has wrong sha256 hash:
ERROR: expected: 794c384f94396ab07e3e6f53a9f8be093facb7eb4193266024302b93b29e12dc
ERROR: got     : e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Please check what changed in the LEGAL file, adjust the commit message
and resend - Thanks.


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
