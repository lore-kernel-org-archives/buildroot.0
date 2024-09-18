Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FBCCDD553
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C384E40223;
	Wed, 18 Sep 2024 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEBmyO99dJZO; Wed, 18 Sep 2024 20:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7741B400F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7741B400F5;
	Wed, 18 Sep 2024 20:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3711BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29013400F5
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:24:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf1eN8nWaBwm for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D113340096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D113340096
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D113340096
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:24:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF9571C0004;
 Wed, 18 Sep 2024 20:24:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sr1ED-00DScX-0C;
 Wed, 18 Sep 2024 22:24:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
Date: Wed, 18 Sep 2024 22:24:45 +0200
In-Reply-To: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Mon, 2 Sep 2024 22:57:06 +0200")
Message-ID: <87a5g4ogky.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 1/2] package/babeld: update URL site
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
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > As reported in [1], version 1.9.2 has been moved to another archive, and
 > it is recommended to use https://github.com/jech/babeld as the official
 > repository.

 > The use of the github macro:

 > $(call github,jech,babeld,babeld-$(BABELD_VERSION))

 > would have downloaded a file with the same name (e.g. babeld-1.9.2.tar.gz)
 > but with a different hash from the one downloaded from the previous URL,
 > creating unacceptable backward compatibility issues.
 > Therefore, it was decided to download the package via the git method. In
 > this way, the downloaded file is babeld-babeld-1.9.2-git4.tar.gz, thus
 > with a different name, to which its SHA can be associated without side
 > effects, except for breaking the release monitoring process.
 > Unfortunately, for now, we will have to live with this limitation.

 > Particularly interesting are the explanations provided by Yann E. Morin,
 > which you can find in [2], that guided the creation of this patch.

 > Fixes:
 > - http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9

 > [1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
 > [2] https://patchwork.ozlabs.org/project/buildroot/patch/20240901063634.3504315-1-dario.binacchi@amarulasolutions.com/

 > Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 > ---
 > Changes v3 -> v4:
 >   - Use the git method to download the package instead of the github
 >     macro.

Committed to 2024.02.x after adjusting the filename and hash for the
2024.02.x logic, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
