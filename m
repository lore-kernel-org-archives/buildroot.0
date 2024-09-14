Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D94C021A0
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C00407C6;
	Sat, 14 Sep 2024 14:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVI1ClXEk8cE; Sat, 14 Sep 2024 14:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D278419AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D278419AB;
	Sat, 14 Sep 2024 14:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2B381BF28C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE6EC40516
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDfkQzwPpIE8 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:50:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C3EF40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3EF40130
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C3EF40130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:50:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BAF420003;
 Sat, 14 Sep 2024 14:50:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1spU6U-00575m-1W;
 Sat, 14 Sep 2024 16:50:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240914071930.1189715-1-peter@korsgaard.com>
 <20240914102356.571622b5@windsurf>
Date: Sat, 14 Sep 2024 16:50:26 +0200
In-Reply-To: <20240914102356.571622b5@windsurf> (Thomas Petazzoni's message of
 "Sat, 14 Sep 2024 10:23:56 +0200")
Message-ID: <87wmjewaq5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 01/23] package/icu: fix typos in help text
 and patch description
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

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 14 Sep 2024 09:19:08 +0200
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/icu/0002-workaround-toolchain-bugs.patch | 2 +-
 >> package/icu/Config.in                            | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)

 > Having fun with some spell-checker? Or AI, or something? :-)

Codespell ()https://github.com/codespell-project/codespell). I mentioned
it in the cover letter of the first series:

https://lore.kernel.org/buildroot/20240910070823.4158894-1-peter@korsgaard.com/

Thanks for applying and fixing stuff.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
