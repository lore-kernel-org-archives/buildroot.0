Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F7C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 18:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D6780EAC;
	Thu, 22 Aug 2024 18:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Hycxlg36J9b; Thu, 22 Aug 2024 18:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 164A181191
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 164A181191;
	Thu, 22 Aug 2024 18:00:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1D771BF35C
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBDB74022E
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 18:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpoDFq_kYTCU for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 18:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDBAB4031A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDBAB4031A
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDBAB4031A
 for <buildroot@uclibc.org>; Thu, 22 Aug 2024 18:00:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1shC6T-0000xG-7w
 for buildroot@uclibc.org; Thu, 22 Aug 2024 20:00:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 22 Aug 2024 19:59:31 +0200
Message-ID: <pan$6d958$47f978d8$3f424973$493f2ba6@ID-313208.user.individual.net>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-5-alex.bennee__3974.23927658878$1724331783$gmane$org@linaro.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 4/4] package/mesa3d: bump to 24.2.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gVGh1LCAyMiBBdWcgMjAyNCAxNDowMjoyMCArMDEwMCBzY2hyaWViIEFsZXggQmVubsOpZToK
Cj4gLU1FU0EzRF9WRVJTSU9OID0gMjQuMC45Cj4gK01FU0EzRF9WRVJTSU9OID0gMjQuMi4wCgpI
aSBBbGV4LAoKdG8gYnVtcCBtZXNhIHRvID49IDI0LjEueCBtb3JlIHBhdGNoZXMgYXJlIG5lZWRl
ZCwgcGxlYXNlIHNlZSBteSBzZXJpZXMgCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQxNjgyNwoKTG9jYWxseSBJIGFsc28gYnVtcGVk
IHRvIDI0LjIuMCBhbHJlYWR5IGJ1dCB0aGUgY29tbWl0IG5lZWRzIHNvbWUgbW9yZSAKbG92ZTog
aHR0cHM6Ly9naXRodWIuY29tL2JrdWhscy9idWlsZHJvb3QvY29tbWl0Lwo3NGJmYmUxZjU0MTY5
NzYxNGVmMTMxOWJjNDIwYjQzZmJkMzBkNDdlCgpXb3VsZCBpdCBiZSBvayBmb3IgeW91IGlmIEkg
c3F1YXNoIHlvdXIgCkJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJUlRJTyBjb21t
aXQgaW50byB0aGUgMjQuMi4wIGJ1bXA/CgpSZWdhcmRzLCBCZXJuZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
