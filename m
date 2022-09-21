Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF64ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D925417B6;
	Wed, 21 Sep 2022 20:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D925417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pp5YCclF0wCn; Wed, 21 Sep 2022 20:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B04C41707;
	Wed, 21 Sep 2022 20:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B04C41707
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21D0C1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AAF961067
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AAF961067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XG-zJt6Ks3m9 for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:35:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B815460FC0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B815460FC0
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:35:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC72B1BF204;
 Wed, 21 Sep 2022 20:35:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ob6R1-002NVW-JK; Wed, 21 Sep 2022 22:35:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220917090521.E9293840CD@busybox.osuosl.org>
Date: Wed, 21 Sep 2022 22:35:07 +0200
In-Reply-To: <20220917090521.E9293840CD@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 17 Sep 2022 10:54:29 +0200")
Message-ID: <87v8pgcvpg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libmdbx: bump version to
 0.11.11
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

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4gd3JpdGVzOgoKID4gY29tbWl0OgogPiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0
L2J1aWxkcm9vdC9jb21taXQvP2lkPWI4ZmY0MzEzMjJmNDYxNGViZGRlYjhiMTVkZDU3ZDUzMDUx
MGYyNjgKID4gYnJhbmNoOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21t
aXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCgogPiBUaGlzIGlzIHN0YWJsZSBidWdmaXggcmVsZWFz
ZSBvZiBsaWJtZGJ4LiBTbyBpdCBpcyByZWFzb25hYmxlIHRvIGJhY2twb3J0CiA+IHRoaXMgcGF0
Y2ggdG8gYWxsIGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgQnVpbGRyb290LgoKID4g
UmVsZWFzZSBub3RlcyBzaW5jZSB2MC4xMS44OgogPiAgLSBmb3IgdjAuMTEuOQogPiBodHRwczov
L2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvcmVsZWFzZS80NzQyNjcxZS1hNjkx
LTQ1YTUtODhkZS1jNjM0MWY3NjJkMGIKID4gIC0gZm9yIHYwLjExLjEwCiA+IGh0dHBzOi8vZ2l0
ZmxpYy5ydS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9yZWxlYXNlLzI4ODZkYWViLWY1ODMtNGMz
MC1iZWRlLWI4ZTYwOTY1YzgzNAogPiAgLSBmb3IgdjAuMTEuMTEKID4gaHR0cHM6Ly9naXRmbGlj
LnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L3JlbGVhc2UvN2YxYTAyNmQtMjhhYS00ZDkyLWEx
ZTAtYTFhNzVlYmUwYjNkCgogPiBUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dpdGZs
aWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAoKID4g
U2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxs
ZW9AeXVyaWV2LnJ1PgogPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPgoKQ29tbWl0dGVkIHRvIDIwMjIuMDIueCwgMjAyMi4wNS54
IGFuZCAyMDIyLjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
