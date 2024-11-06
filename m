Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589B6D59F6C
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D0981302;
	Wed,  6 Nov 2024 20:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXe19yqMPZtR; Wed,  6 Nov 2024 20:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B5B88130B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5B88130B;
	Wed,  6 Nov 2024 20:11:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2FFF3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0A8D40260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zduecrzlDJl for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:10:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58C0F40A81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58C0F40A81
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58C0F40A81
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:10:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EC22240002;
 Wed,  6 Nov 2024 20:10:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t8mMf-000OSQ-2Z;
 Wed, 06 Nov 2024 21:10:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <AS1P250MB060853D74B61711941030E9AA9512@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Date: Wed, 06 Nov 2024 21:10:53 +0100
In-Reply-To: <AS1P250MB060853D74B61711941030E9AA9512@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 (Michel Alex's message of "Mon, 4 Nov 2024 12:41:48 +0000")
Message-ID: <871pzof7hu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/libzenoh-pico: bump to version
 1.0.1
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

>>>>> "Michel" == Michel Alex <Alex.Michel@wiedemann-group.com> writes:

 > https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.0.1
 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
> ---
 >  package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 >  package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
 > index 66f5285cfd..0462203223 100644
 > --- a/package/libzenoh-pico/libzenoh-pico.hash
 > +++ b/package/libzenoh-pico/libzenoh-pico.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  f489e0fdd3ae07be1a6483bd47113727ae931749968379d823e957cbdde9e8dc  libzenoh-pico-1.0.0.tar.gz
 > +sha256  8f675d72b1141ab844947ad3a2a4932f6469324c76cd819cb2724d5dabee7d93  libzenoh-pico-1.0.1.tar.gz
 >  sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
 > diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
 > index 6009b7d8bb..166dbfdb1a 100644
 > --- a/package/libzenoh-pico/libzenoh-pico.mk
 > +++ b/package/libzenoh-pico/libzenoh-pico.mk
 > @@ -7,7 +7,7 @@
 >  # This 1.0.0 version is really newer than 1.0.0.12, so please don't
 >  # update 1.0.0 even if release-monitoring.org claims it's a newer
 >  # version.

1.0.1 sorts after 1.0.0.12, so we can now drop this comment. Commited
with this removed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
