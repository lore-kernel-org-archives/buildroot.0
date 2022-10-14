Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD0AC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 14:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56692416D4;
	Fri, 14 Oct 2022 14:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56692416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6EZroMqnPxX; Fri, 14 Oct 2022 14:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3707B410D4;
	Fri, 14 Oct 2022 14:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3707B410D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A48A1BF2F9
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 560A040D7E
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 560A040D7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuzVlLeOXCLD for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 14:08:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D8D64060D
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D8D64060D
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:08:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 470C640008;
 Fri, 14 Oct 2022 14:08:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ojLMW-00G5AT-Ca; Fri, 14 Oct 2022 16:08:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20221012204246.904703-1-leo@yuriev.ru>
Date: Fri, 14 Oct 2022 16:08:32 +0200
In-Reply-To: <20221012204246.904703-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Wed, 12 Oct 2022 23:42:46 +0300")
Message-ID: <87mt9ylcpr.fsf@dell.be.48ers.dk>
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
CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
