Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3FAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCF741503;
	Sat, 15 Oct 2022 15:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCF741503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eegLBVmqYaXL; Sat, 15 Oct 2022 15:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCC4410AC;
	Sat, 15 Oct 2022 15:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCCC4410AC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C00C1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4522260BB2
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4522260BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsInleZTSY2S for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:40:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 275D260B01
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 275D260B01
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:40:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CCCE6000A;
 Sat, 15 Oct 2022 15:40:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ojjGl-00H0TI-Fw; Sat, 15 Oct 2022 17:40:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221014222051.48942-1-fontaine.fabrice@gmail.com>
Date: Sat, 15 Oct 2022 17:40:11 +0200
In-Reply-To: <20221014222051.48942-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 Oct 2022 00:20:51 +0200")
Message-ID: <87tu45f63o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: security bump to version
 1.12.24
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

Pj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPiB3cml0ZXM6CgogPiBEZW5pYWwgb2Ygc2VydmljZSBmaXhlczoKID4gRXZnZW55IFZl
cmVzaGNoYWdpbiBkaXNjb3ZlcmVkIHNldmVyYWwgd2F5cyBpbiB3aGljaCBhbiBhdXRoZW50aWNh
dGVkCiA+IGxvY2FsIGF0dGFja2VyIGNvdWxkIGNhdXNlIGEgY3Jhc2ggKGRlbmlhbCBvZiBzZXJ2
aWNlKSBpbgogPiBkYnVzLWRhZW1vbiAtLXN5c3RlbSBvciBhIGN1c3RvbSBEQnVzU2VydmVyLiBJ
biB1bmNvbW1vbiBjb25maWd1cmF0aW9ucwogPiB0aGVzZSBjb3VsZCBwb3RlbnRpYWxseSBiZSBj
YXJyaWVkIG91dCBieSBhbiBhdXRoZW50aWNhdGVkIHJlbW90ZQogPiBhdHRhY2tlci4KCiA+IOKA
oiBBbiBpbnZhbGlkIGFycmF5IG9mIGZpeGVkLWxlbmd0aCBlbGVtZW50cyB3aGVyZSB0aGUgbGVu
Z3RoIG9mIHRoZQogPiAgIGFycmF5IGlzIG5vdCBhIG11bHRpcGxlIG9mIHRoZSBsZW5ndGggb2Yg
dGhlIGVsZW1lbnQgd291bGQgY2F1c2UgYW4KID4gICBhc3NlcnRpb24gZmFpbHVyZSBpbiBkZWJ1
ZyBidWlsZHMgb3IgYW4gb3V0LW9mLWJvdW5kcyByZWFkIGluCiA+ICAgcHJvZHVjdGlvbiBidWls
ZHMuIFRoaXMgd2FzIGEgcmVncmVzc2lvbiBpbiB2ZXJzaW9uIDEuMy4wLgogPiAgIChkYnVzIzQx
MywgQ1ZFLTIwMjItNDIwMTE7IFNpbW9uIE1jVml0dGllKQoKID4g4oCiIEEgc3ludGFjdGljYWxs
eSBpbnZhbGlkIHR5cGUgc2lnbmF0dXJlIHdpdGggaW5jb3JyZWN0bHkgbmVzdGVkCiA+ICAgcGFy
ZW50aGVzZXMgYW5kIGN1cmx5IGJyYWNrZXRzIHdvdWxkIGNhdXNlIGFuIGFzc2VydGlvbiBmYWls
dXJlIGluCiA+ICAgZGVidWcgYnVpbGRzLiBTaW1pbGFyIG1lc3NhZ2VzIGNvdWxkIHBvdGVudGlh
bGx5IHJlc3VsdCBpbiBhIGNyYXNoIG9yCiA+ICAgaW5jb3JyZWN0IG1lc3NhZ2UgcHJvY2Vzc2lu
ZyBpbiBhIHByb2R1Y3Rpb24gYnVpbGQsIGFsdGhvdWdoIHdlIGFyZQogPiAgIG5vdCBhd2FyZSBv
ZiBhIHByYWN0aWNhbCBleGFtcGxlLiAoZGJ1cyM0MTgsIENWRS0yMDIyLTQyMDEwOwogPiAgIFNp
bW9uIE1jVml0dGllKQoKID4g4oCiIEEgbWVzc2FnZSBpbiBub24tbmF0aXZlIGVuZGlhbm5lc3Mg
d2l0aCBvdXQtb2YtYmFuZCBVbml4IGZpbGUKID4gICBkZXNjcmlwdG9ycyB3b3VsZCBjYXVzZSBh
IHVzZS1hZnRlci1mcmVlIGFuZCBwb3NzaWJsZSBtZW1vcnkKID4gICBjb3JydXB0aW9uIGluIHBy
b2R1Y3Rpb24gYnVpbGRzLCBvciBhbiBhc3NlcnRpb24gZmFpbHVyZSBpbiBkZWJ1ZwogPiAgIGJ1
aWxkcy4gVGhpcyB3YXMgYSByZWdyZXNzaW9uIGluIHZlcnNpb24gMS4zLjAuIChkYnVzIzQxNywK
ID4gICBDVkUtMjAyMi00MjAxMjsgU2ltb24gTWNWaXR0aWUpCgogPiBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvZGJ1cy9kYnVzLy0vYmxvYi9kYnVzLTEuMTIuMjQvTkVXUwoKID4gU2ln
bmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+
CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
