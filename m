Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF9DC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBC441F94;
	Tue,  6 Feb 2024 15:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BBC441F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WYs934O9OeDI; Tue,  6 Feb 2024 15:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F287341F8A;
	Tue,  6 Feb 2024 15:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F287341F8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2B751BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBD4941F8A
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD4941F8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVVuyKMjo0JF for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:07:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C5941F85
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C5941F85
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF9F0FF803;
 Tue,  6 Feb 2024 15:07:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rXN2t-00DvJ2-04;
 Tue, 06 Feb 2024 16:07:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240109070626.4019996-1-james.hilliard1@gmail.com>
 <20240206112714.7beb00e5@windsurf>
Date: Tue, 06 Feb 2024 16:07:34 +0100
In-Reply-To: <20240206112714.7beb00e5@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 6 Feb 2024 11:27:14 +0100")
Message-ID: <87cyt97hs9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump to version
 5.0.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue,  9 Jan 2024 00:06:26 -0700
 > James Hilliard <james.hilliard1@gmail.com> wrote:

 >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> ---
 >> package/python-django/python-django.hash | 4 ++--
 >> package/python-django/python-django.mk   | 4 ++--
 >> 2 files changed, 4 insertions(+), 4 deletions(-)

 > Applied to master, thanks.

Notice that django-5.0.x is not a LTS, but given that it goes out of
extended support in April 2025 it is probably OK.

See (bottow of) https://www.djangoproject.com/download/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
