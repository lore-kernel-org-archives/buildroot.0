Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3830FC43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C19607A1;
	Mon, 27 Jun 2022 22:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4C19607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-wVngmtR76x; Mon, 27 Jun 2022 22:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD086076C;
	Mon, 27 Jun 2022 22:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD086076C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161561BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F13356076C
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F13356076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZqx5m4-oizV for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:13:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B842260759
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B842260759
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:13:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C2B28240002;
 Mon, 27 Jun 2022 22:13:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5wzJ-00D4g6-SC; Tue, 28 Jun 2022 00:13:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20220625171830.4009753-1-leo@yuriev.ru>
Date: Tue, 28 Jun 2022 00:13:45 +0200
In-Reply-To: <20220625171830.4009753-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Sat, 25 Jun 2022 20:18:29 +0300")
Message-ID: <878rphvjom.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.8
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gItCb0LXQvtC90LjQtCIgPT0g0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZ
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIHN0YWJsZSBidWdmaXgg
cmVsZWFzZSBvZiBsaWJtZGJ4LgogPiBUaGUgcHJvamVjdCdzIHdlYnNpdGUgbm93IGlzIG9uIGh0
dHBzOi8vbGlibWRieC5kcWRrZmEucnUvCgogPiBSZWxlYXNlIG5vdGVzIGZvciB2MC4xMS44CiA+
IGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9yZWxlYXNlLzA2MjY4
MDM4LTM5ZmYtNDI3MC05YmU4LTlmMjZkNTU0MzAxNQoKID4gVGhlIGNvbXBsZXRlIENoYW5nZUxv
ZzogaHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2Jsb2I/ZmlsZT1D
aGFuZ2VMb2cubWQKCiA+IFNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChM
ZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KCkNvbW1pdHRlZCwgdGhhbmtzLgoKU2hvdWxk
IHRoaXMgYWxzbyBiZSBiYWNrcG9ydGVkIHRvIDIwMjIuMDIueCAvIDIwMjIuMDUueD8KCi0tIApC
eWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
