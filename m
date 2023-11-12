Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C08CC4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 11:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4CC5610DD;
	Sun, 12 Nov 2023 11:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CC5610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wsc1J6zOBJOX; Sun, 12 Nov 2023 11:35:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332C160FBD;
	Sun, 12 Nov 2023 11:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 332C160FBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B79551BF3B8
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 11:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89A6481BB4
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 11:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89A6481BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rXONDf-6f9P for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 11:35:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0793E81A3B
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 11:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0793E81A3B
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7F3140002;
 Sun, 12 Nov 2023 11:35:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r28k5-008zO2-0r;
 Sun, 12 Nov 2023 12:35:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: hmaied.benabdellatif@etictelecom.com
References: <20231106143037.6900-1-hmaied.benabdellatif@etictelecom.com>
Date: Sun, 12 Nov 2023 12:35:05 +0100
In-Reply-To: <20231106143037.6900-1-hmaied.benabdellatif@etictelecom.com>
 (hmaied benabdellatif's message of "Mon, 6 Nov 2023 15:30:37 +0100")
Message-ID: <87pm0fgq6u.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/openldap: bump version to 2.5.16
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
Cc: David Bender <codehero@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "hmaied" == hmaied benabdellatif <hmaied.benabdellatif@etictelecom.com> writes:

 > From: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>
 > Stripping when cross-compiling and libtool static behavior are fixed in 2.5.16.

 > Signed-off-by: Hmaied Ben Abdellatif <hmaied.benabdellatif@etictelecom.com>

 > ---
 > Changes v1 -> v2:
 >   - Check locally sha256 hash

Committed after adjusting .checkpackageignore and extending the commit
message a bit, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
