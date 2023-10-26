Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631C5C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1419542DD8;
	Thu, 26 Oct 2023 16:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1419542DD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwOiu3qmDEQV; Thu, 26 Oct 2023 16:34:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63E042DCD;
	Thu, 26 Oct 2023 16:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63E042DCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1158B1BF239
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D687A41D82
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D687A41D82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfXdVo3zJ4rX for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:34:39 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C79E416F1
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C79E416F1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8695220008;
 Thu, 26 Oct 2023 16:34:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qw3Jc-006yI7-Md; Thu, 26 Oct 2023 18:34:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20231015051544.429666-1-james.hilliard1@gmail.com>
 <32fce31e-418f-6781-dd4c-693013215171@mind.be>
Date: Thu, 26 Oct 2023 18:34:36 +0200
In-Reply-To: <32fce31e-418f-6781-dd4c-693013215171@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sun, 15 Oct 2023 22:24:02
 +0200")
Message-ID: <871qdhny03.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.44.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 15/10/2023 07:15, James Hilliard wrote:
 >> Drop patches which are now upstream.
 >> CONTRIBUTING.md hash changed due to text updates:
 >> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/987488a7ac4a193ea6160ab65a4bb215481cafb7

 >  That explanation wasn't really sufficient, though I admit it's
 >  difficult to do better :-) I changed it to:

 >     CONTRIBUTING.md hash changed due to text various text updates, most of

".. text various text" also sounds a bit odd ;)

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
