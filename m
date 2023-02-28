Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11905C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 21:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946988144D;
	Tue, 28 Feb 2023 21:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 946988144D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKhoUnMHKaPS; Tue, 28 Feb 2023 21:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE5228144A;
	Tue, 28 Feb 2023 21:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE5228144A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 182AF1BF2BF
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39818144D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F39818144D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNR9C-ftJsaH for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 21:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06FCE8144A
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06FCE8144A
 for <buildroot@uclibc.org>; Tue, 28 Feb 2023 21:23:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pX7RE-0008da-DY
 for buildroot@uclibc.org; Tue, 28 Feb 2023 22:23:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 28 Feb 2023 22:22:15 +0100
Message-ID: <pan$15c33$6e8d1e3a$c7eb20b6$63ca0c72@ID-313208.user.individual.net>
References: <20230220205242.72DA9828C8@busybox.osuosl.org>
 <F0F23143-1728-473C-8242-E88E2980B115__8554.50415271974$1677599803$gmane$org@jens-maus.de>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.4
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

QW0gVHVlLCAyOCBGZWIgMjAyMyAxNjo0ODo1MSArMDEwMCBzY2hyaWViIEplbnMgTWF1cyB2aWEg
YnVpbGRyb290OgoKPiBTb3JyeSBpZiByZXBseWluZyB0byB0aGlzIG1haWwgZG9lcyBub3Qgc2Vl
bSB0byBiZSBhcHByb3ByaWF0ZSwgYnV0IEkKPiBqdXN0IHRlc3RlZCB0aGUgbGF0ZXN0IEJ1aWxk
cm9vdCAyMDIzLjAyLXJjMiB2ZXJzaW9uIGFuZCBub3RpY2VkIHRoYXQKPiB0aGUgYnVpbGRzIG9m
IHRoZSBtZXNhM2QgcGFja2FnZSBpbW1lZGlhdGVseSBzdG9wcGVkIHdvcmtpbmcgYmVjYXVzZSBp
bgo+IDIyLjMueCB2ZXJzaW9uIG9mIG1lc2EzZCB0aGUg4oCeZ2xzbGFuZ1ZhbGlkYXRvcuKAnCB0
b29sIHNlZW0gdG8gYmUgYSBuZXcKPiBkZXBlbmRlbmN5IG9mIG1lc2EzZCBhbmQgdGhlIEJ1aWxk
cm9vdCBwYWNrYWdlIGRvZXMgbm90IGluc3RhbGwgdGhpcwo+IGhvc3QgdG9vbCBpdHNlbGYgKG5v
IGdhc2xhbmctdG9vbHMgcGFja2FnZSksIHRodXMgdGhlIGJ1aWxkIGZhaWxzIGlmIHRoZQo+IGJ1
aWxkIGhvc3QgaXRzZWxmIGRvZXMgbm90IGhhdmUgdGhpcyBidWlsZCB0b29sIGluc3RhbGxlZC4K
CkhpIEplbnMsCgpkbyB0aGVzZSBwYXRjaGVzIGZpeCB0aGUgcHJvYmxlbT8KaHR0cDovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zMzM1ODUKClJl
Z2FyZHMsIEJlcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
