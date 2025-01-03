Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E081CE77188
	for <buildroot@archiver.kernel.org>; Fri,  3 Jan 2025 19:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9071A80FBA;
	Fri,  3 Jan 2025 19:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxk1BTC2wV8t; Fri,  3 Jan 2025 19:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9397C810AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9397C810AC;
	Fri,  3 Jan 2025 19:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE0B7AF0
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9019640544
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mcr33-7jV_Fo for <buildroot@buildroot.org>;
 Fri,  3 Jan 2025 19:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 373E940549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373E940549
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 373E940549
 for <buildroot@buildroot.org>; Fri,  3 Jan 2025 19:08:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2206EC0003;
 Fri,  3 Jan 2025 19:08:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tTn1v-004FAr-2Q;
 Fri, 03 Jan 2025 20:08:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org,  Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>,  Zoltan Gyarmati
 <zgyarmati@zgyarmati.de>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Jesse Van Gavere <jesseevg@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
 <20241213115820.655993-8-roykollensvendsen@gmail.com>
Date: Fri, 03 Jan 2025 20:08:19 +0100
In-Reply-To: <20241213115820.655993-8-roykollensvendsen@gmail.com> (Roy Kollen
 Svendsen's message of "Fri, 13 Dec 2024 12:58:15 +0100")
Message-ID: <87r05jhg0s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 8/8] package/qt6/qt6opcua: fix 'qt6opcua'
 typo
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

>>>>> "Roy" == Roy Kollen Svendsen <roykollensvendsen@gmail.com> writes:

 > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Committed to 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
