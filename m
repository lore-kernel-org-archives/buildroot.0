Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC98C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE86817A1;
	Thu, 21 Mar 2024 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12Q9gVUeKbbx; Thu, 21 Mar 2024 20:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C997817A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C997817A6;
	Thu, 21 Mar 2024 20:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA701BF292
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08571410E7
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 20:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXRxIJId3hD5 for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 20:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07DA2410E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07DA2410E4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07DA2410E4
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 20:59:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEA97240006;
 Thu, 21 Mar 2024 20:59:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rnPVF-005boR-0U;
 Thu, 21 Mar 2024 21:59:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
 <4976560.e9J7NaK4W3@earth>
 <9df182fa-a743-4df8-a160-9a6341837c19@mind.be>
 <15933709.O9o76ZdvQC@earth>
Date: Thu, 21 Mar 2024 21:59:09 +0100
In-Reply-To: <15933709.O9o76ZdvQC@earth> (Jeremy J. Peper's message of "Mon,
 18 Mar 2024 10:45:26 -0500")
Message-ID: <871q8347z6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: bump version
 to 2.1.58
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jeremy" == Jeremy J Peper <jeremy@jeremypeper.com> writes:

 >> > Thanks again for all your feedback and guidance.
 >> > -Jeremy

 > Excellent, is it possible to get this fix added to the next release of 
 > 2024.02.x ?

Yes, committed to 2024.02.x, 2023.02.x and 2023.11.x, thanks - It will
be part of the upcoming 2024.02.1 release.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
