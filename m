Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62243D3B98E
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278564C62F;
	Tue, 26 Nov 2024 13:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAoBzF9-fscH; Tue, 26 Nov 2024 13:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 202DE4C65F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 202DE4C65F;
	Tue, 26 Nov 2024 13:26:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8BB5DB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7139405A5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAg-eoON6jGY for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2D7D40589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D7D40589
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2D7D40589
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E28E1BF205;
 Tue, 26 Nov 2024 13:26:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFvZy-008oUa-0v;
 Tue, 26 Nov 2024 14:26:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Cc: Yu Chien Peter Lin <peterlin@andestech.com>,  <ycliang@andestech.com>
References: <20241119014601.1660159-1-peterlin@andestech.com>
Date: Tue, 26 Nov 2024 14:26:10 +0100
In-Reply-To: <20241119014601.1660159-1-peterlin@andestech.com> (Yu Chien Peter
 Lin via buildroot's message of "Tue, 19 Nov 2024 09:46:01 +0800")
Message-ID: <87bjy2m8i5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: update maintainer of Andes
 platform
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yu" == Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> writes:

 > I will lose access to my email next week, so hand
 > it over to Leo Yu-Chi Liang.

 > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
 > Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
