Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16057C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF6CC4263A;
	Sat,  8 Jun 2024 16:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS3jC_lLJlH0; Sat,  8 Jun 2024 16:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B707F41A1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B707F41A1C;
	Sat,  8 Jun 2024 16:56:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C92F91BF414
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C45DA6070F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3es2sF6jNwo for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A48AD606FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A48AD606FD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A48AD606FD
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:56:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A7781BF203;
 Sat,  8 Jun 2024 16:56:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzMx-0027C4-27;
 Sat, 08 Jun 2024 18:56:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier via buildroot <buildroot@buildroot.org>
References: <20240529202425.469185-1-brandon.maier@collins.com>
 <20240529202425.469185-4-brandon.maier@collins.com>
Date: Sat, 08 Jun 2024 18:56:43 +0200
In-Reply-To: <20240529202425.469185-4-brandon.maier@collins.com> (Brandon
 Maier via buildroot's message of "Wed, 29 May 2024 20:24:25 +0000")
Message-ID: <87h6e3xtis.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/4] DEVELOPERS: add myself for package/mtd
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Brandon" == Brandon Maier via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Committed to 2024.02.x, thanks.

> ---
 >  DEVELOPERS | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 52c9b84a9d..cc9f3b7165 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -544,6 +544,7 @@ F:	configs/ls1046a-frwy_defconfig
 >  F:	package/bats-assert/
 >  F:	package/bats-file/
 >  F:	package/bats-support/
 > +F:	package/mtd/
 >  F:	package/python-pysensors/
 >  F:	package/qoriq-fm-ucode/
 >  F:	package/unifdef/
 > -- 

 > 2.45.1

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
