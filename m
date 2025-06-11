Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003F5C71136
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 21:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74F7D606D5;
	Wed, 11 Jun 2025 21:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZwful6kOKBb; Wed, 11 Jun 2025 21:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3E8F607E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3E8F607E8;
	Wed, 11 Jun 2025 21:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1FD81F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 21:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E38CF607E8
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 21:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k00cmVHGeAWT for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 21:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CA51606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CA51606D5
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CA51606D5
 for <buildroot@uclibc.org>; Wed, 11 Jun 2025 21:39:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1uPTA3-000AR3-O2
 for buildroot@uclibc.org; Wed, 11 Jun 2025 23:39:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 11 Jun 2025 23:38:19 +0200
Message-ID: <pan$97079$1dcb0ba7$e499ebdb$a7f8e94b@ID-313208.user.individual.net>
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-2-alex.bennee__11620.3121536941$1749640635$gmane$org@linaro.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH v6 1/5] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gV2VkLCAxMSBKdW4gMjAyNSAxMjoxNjozNCArMDEwMCBzY2hyaWViIEFsZXggQmVubsOpZToK
Cj4gLU1FU0EzRF9WRVJTSU9OID0gMjUuMC42Cj4gK01FU0EzRF9WRVJTSU9OID0gMjUuMS4zCgpI
aSBBbGV4LAoKdGhlIC1uZXh0IGJyYW5jaCwgdG8gYmUgbWVyZ2VkIHdpdGggbWFzdGVyLCBhbHJl
YWR5IGNvbnRhaW5zIDI1LjEuMToKaHR0cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVpbGRyb290L2Nv
bW1pdC8/aD1uZXh0JmlkPTJmN2JjYzdkZmM1MjE3NzJhMzk1YWJhMDg0ZWJhMzFlNjYyMmU5NGQK
ClJlZ2FyZHMsIEJlcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
