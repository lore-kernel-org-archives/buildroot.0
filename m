Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD5CC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 213B0811C8;
	Sun, 28 Jul 2024 10:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACxq0RmoeG_r; Sun, 28 Jul 2024 10:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21299811B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21299811B8;
	Sun, 28 Jul 2024 10:04:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F0C41BF588
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49552811B8
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNkTTlzElaus for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3133D811B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3133D811B4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3133D811B4
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:04:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F97620003;
 Sun, 28 Jul 2024 10:04:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sY0l8-0025kc-1x;
 Sun, 28 Jul 2024 12:04:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
 <20240711211020.000370bb@windsurf>
Date: Sun, 28 Jul 2024 12:04:10 +0200
In-Reply-To: <20240711211020.000370bb@windsurf> (Thomas Petazzoni via
 buildroot's message of "Thu, 11 Jul 2024 21:10:20 +0200")
Message-ID: <87o76hx279.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
Cc: alex <alexander.wellbrock@othermo.de>, a.wellbrock@mailbox.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Mon, 17 Jun 2024 20:01:57 +0200
 > Alexander Wellbrock via buildroot <buildroot@buildroot.org> wrote:

 >> From: alex <alexander.wellbrock@othermo.de>
 >> 
 >> Download URLs changed after hosting of the c-ares website changed
 >> ownership:
 >> https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/
 >> 
 >> This cannot be fixed upstream as github pages does not support .htaccess
 >> files according to:
 >> https://github.com/c-ares/c-ares.github.io/issues/2
 >> 
 >> Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
 >> ---
 >> package/c-ares/c-ares.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > Applied to master, after fixing the From: field to match with the
 > Signed-off-by, as Alexander clarified in a follow-up e-mail. Thanks a
 > lot for your contribution Alexander!

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
