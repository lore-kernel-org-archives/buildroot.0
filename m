Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62788C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 122B6405E9;
	Sun,  4 Feb 2024 21:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 122B6405E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUzghuLREDAp; Sun,  4 Feb 2024 21:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0432A40620;
	Sun,  4 Feb 2024 21:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0432A40620
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2152D1BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0745882292
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0745882292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8H1lWc-pI2rb for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:32:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 067C580967
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 067C580967
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE0B71BF203;
 Sun,  4 Feb 2024 21:32:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWk6R-00A5F6-2T;
 Sun, 04 Feb 2024 22:32:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
 <20240123190035.904936-3-adam.duskett@amarulasolutions.com>
Date: Sun, 04 Feb 2024 22:32:39 +0100
In-Reply-To: <20240123190035.904936-3-adam.duskett@amarulasolutions.com> (Adam
 Duskett's message of "Tue, 23 Jan 2024 12:00:34 -0700")
Message-ID: <871q9rx6dk.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/3] package/flutter-pi: Fix help text for
 gstreamer audio player
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

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > The help text is currently copy and pasted from the gstreamer video
 > player plugin help text. Change it to reflect the text from the
 > CMakeLists.txt file.

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
