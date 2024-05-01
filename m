Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC194C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8883681B0A;
	Wed,  1 May 2024 20:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVbteOVfx6yn; Wed,  1 May 2024 20:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC8F081BFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC8F081BFA;
	Wed,  1 May 2024 20:16:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 434A81BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FAC481BFA
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX5pKRQ_IzsO for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61F8F81B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F8F81B0A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F8F81B0A
 for <buildroot@busybox.net>; Wed,  1 May 2024 20:16:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FC86E0002;
 Wed,  1 May 2024 20:16:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s2GNE-009zmh-2M;
 Wed, 01 May 2024 22:16:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad <francois.perrad@gadz.org>
References: <20240403084033.512286-1-francois.perrad@gadz.org>
 <20240403084033.512286-4-francois.perrad@gadz.org>
Date: Wed, 01 May 2024 22:16:16 +0200
In-Reply-To: <20240403084033.512286-4-francois.perrad@gadz.org> (Francois
 Perrad's message of "Wed, 3 Apr 2024 10:40:32 +0200")
Message-ID: <87sez18ezz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 4/5] package/libnpth: bump to version 1.7
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

>>>>> "Francois" == Francois Perrad <francois.perrad@gadz.org> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
