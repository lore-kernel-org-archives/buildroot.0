Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5123BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DC1414E5;
	Sat, 15 Oct 2022 15:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9DC1414E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuQ-8R53CY07; Sat, 15 Oct 2022 15:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90EDE410E8;
	Sat, 15 Oct 2022 15:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90EDE410E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 221FB1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F196D81B04
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F196D81B04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jS26mFbcSsWk for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:30:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C21C981AF3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C21C981AF3
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:30:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 086CCFF806;
 Sat, 15 Oct 2022 15:30:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ojj7f-00GzjM-08; Sat, 15 Oct 2022 17:30:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20221012204246.904703-1-leo@yuriev.ru>
Date: Sat, 15 Oct 2022 17:30:46 +0200
In-Reply-To: <20221012204246.904703-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Wed, 12 Oct 2022 23:42:46 +0300")
Message-ID: <87bkqdgl3t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.12
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
cmVsZWFzZSBvZiBsaWJtZGJ4LiBTbyBpdCBpcyByZWFzb25hYmxlIHRvIGJhY2twb3J0CiA+IHRo
aXMgcGF0Y2ggdG8gYWxsIGFwcGxpY2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgQnVpbGRyb290
LgoKID4gUmVsZWFzZSBub3RlcyBmb3IgdjAuMTEuMTIKID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KCiA+IEZpeGVzOgoKID4gICAtIEZpeGVkIHN0YXRpYyBhc3NlcnRpb24gZmFpbHVyZSBv
biBwbGF0Zm9ybXMgd2hlcmUgdGhlIGBvZmZfdGAgdHlwZSBpcyB3aWRlcgogPiAgICAgdGhhbiBj
b3JyZXNwb25kaW5nIGZpZWxkcyBvZiBgc3RydWN0IGZsb2NrYCB1c2VkIGZvciBmaWxlIGxvY2tp
bmcgKGJhY2twb3J0KS4KID4gICAgIE5vdyBfbGlibWRieF8gd2lsbCB1c2UgYGZjbnRsNjQoRl9H
RVRMSzY0L0ZfU0VUTEs2NC9GX1NFVExLVzY0KWAgaWYgYXZhaWxhYmxlLgogPiAgIC0gRml4ZWQg
YXNzZXJ0aW9uIGNoZWNrIGluc2lkZSBgcGFnZV9yZXRpcmVfZXgoKWAgKGJhY2twb3J0KS4KCiA+
IE1pbm9yczoKCiA+ICAgLSBGaXhlZCBgLVdpbnQtdG8tcG9pbnRlci1jYXN0YCB3YXJuaW5ncyB3
aGlsZSBjYXN0aW5nIHRvIGBtZGJ4X3RpZF90YCAoYmFja3BvcnQpLgogPiAgIC0gUmVtb3ZlZCBu
ZWVkbGVzcyBgTG9ja0ZpbGVFeCgpYCBpbnNpZGUgYG1kYnhfZW52X2NvcHkoKWAgKGJhY2twb3J0
KS4KCiA+IFRoZSBjb21wbGV0ZSBDaGFuZ2VMb2c6IGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0
L2VydGhpbmsvbGlibWRieC9ibG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCgogPiBTaWduZWQtb2ZmLWJ5
OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+
CgpDb21taXR0ZWQgdG8gMjAyMi4wOC54IGFuZCAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
