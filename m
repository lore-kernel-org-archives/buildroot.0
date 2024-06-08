Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0362C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BDC542661;
	Sat,  8 Jun 2024 11:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6Y8vmGZncew; Sat,  8 Jun 2024 11:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCCFC424CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCCFC424CB;
	Sat,  8 Jun 2024 11:22:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 311061BF5DA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DA6F40169
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOB1pqVbcrJ8 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A7681400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7681400FE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7681400FE
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:22:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CF50E0002;
 Sat,  8 Jun 2024 11:22:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFu9C-00GqT6-1j;
 Sat, 08 Jun 2024 13:22:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20240314161116.714877-1-leo@yuriev.ru>
Date: Sat, 08 Jun 2024 13:22:10 +0200
In-Reply-To: <20240314161116.714877-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Thu, 14 Mar 2024 19:11:13 +0300")
Message-ID: <87le3f7k7x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.10
 "SEM"
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
dXJpZXYpIDxsZW9AeXVyaWV2LnJ1PiB3cml0ZXM6CgogPiBUaGlzIGlzIGJ1Z2ZpeCByZWxlYXNl
IG9mIHN0YWJsZSBsaWJtZGJ4IGJyYW5jaCwgaW4gbWVtb3J5IG9mIHRoZSBIZXJvCiA+IG9mIFJ1
c3NpYSBHdWFyZCBNYWpvciBEbWl0cnkgU2VtZW5vdiB3aXRoIHRoZSBjYWxsIHNpZ24gIlNFTSIu
CgogPiBJdCBpcyByZWFzb25hYmxlIHRvIGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gYWxsIGFwcGxp
Y2FibGUgcmVsZWFzZXMvYnJhbmNoZXMgb2YgQnVpbGRyb290LgoKID4gVGhlIG1vc3Qgc2lnbmlm
aWNhbnQgZml4ZXMgc2luY2UgdjAuMTIuOCAocHJldmlvdXMgdmVyc2lvbiBwaW5uZWQgdG8gYnVp
bGRyb290KToKCiA+ICAtIEZpeGVkIGFuIG1ham9yIGJ1ZyBpbmhlcml0ZWQgZnJvbSBMTURCIChM
aWdodG5pbmcgTWVtb3J5LU1hcHBlIERhdGFiYXNlKQogPiAgICB0aGF0IGNhdXNlcyBkYXRhYmFz
ZSBjb3JydXB0aW9uIGR1cmluZyB1c2UgdGhlIE1EQlhfRFVQRklYRUQgbW9kZS4KID4gICAgSW4g
TE1EQiwgdGhlIHByb2JsZW0gaGFzIGV4aXN0ZWQgZm9yIG1vcmUgdGhhbiAxMCB5ZWFycyBhbmQg
aXMgc3RpbGwKID4gICAgcHJlc2VudCAoYXMgd2VsbCBhcyBtb3JlIHRoYW4gYSBkb3plbiBvdGhl
ciBidWcgYW5kIHNob3J0Y29taW5ncwogPiAgICBmaXhlZCBpbiBsaWJtZGJ4KS4KCiA+ICAtIEZp
eGVkIG9mIGEgZmFsc2UgZXJyb3IgTURCWF9DT1JSVVBURUQgKC0zMDc5NikgaW4gdGhlIHNjZW5h
cmlvIG9mCiA+ICAgIHdvcmtpbmcgaW4gdGhlIG1vZGUgTURCWF9EVVBGSVhFRCB3aXRoIG9kZCBs
ZW5ndGggb2YgbXVsdGktdmFsdWVzLgoKID4gIC0gRml4ZWQgYSBidWcgaW4gYWRqdXN0aW5nIHRo
ZSBjdXJzb3JzIGluIHRoZSBjYXNlIHNwbGl0dGluZyBhIHBhZ2UgYnkKID4gICAgYWRkaW5nIGEg
bmV3IHBhZ2Ugb24gdGhlIGxlZnQuCgogPiAgLSBUcm91Ymxlc2hvb3RpbmcgYW4gZXJyb3Igd2hl
biBvcGVuaW5nIGEgZGF0YWJhc2Ugb24gYSByZWFkLW9ubHkgZmlsZSBzeXN0ZW0uCgogPiAgLSBB
IHNldCBvZiBDKysgQVBJIGltcHJvdmVtZW50czoKCiA+ICAgICAtIGFkZGVkIHRoZSBtZGJ4Ojpj
dXJzb3I6OmVzdGltYXRpb25fcmVzdWx0IHR5cGUsIGFuZCB0aGUgYmVoYXZpb3IKID4gICAgICAg
b2YgbWV0aG9kcyBjdXJzb3I6OmVzdGltYXRlKCkgaXMgdW5pZmllZCB3aXRoIGN1cnNvcjo6bW92
ZSgpOwoKID4gICAgIC0gdG8gcHJldmVudCB1bm5vdGljZWFibGUgaW5jb3JyZWN0IHVzZSBvZiB0
aGUgQVBJLCBmb3IgaW5pdGlhbGl6aW5nCiA+ICAgICAgIHNsaWNlcyByZXR1cm5lZCBieSByZWZl
cmVuY2UgdGhlIHNsaWNlOjppbnZhbGlkKCkgaXMgdXNlZCwgaW5zdGVhZCBvZgogPiAgICAgICBl
bXB0eSBzbGljZXM7CgogPiAgICAgLSBhZGRlZCBhZGRpdGlvbmFsIEMrKyBjb252ZXJzaW9uIG9w
ZXJhdG9ycyB0byBDIEFQSSB0eXBlczsKCiA+ICAgICAtIHR5cGVzIGJ1ZmZlcjo6bW92ZV9hc3Np
Z25fYWxsb2MgYW5kIGJ1ZmZlcjo6Y29weV9hc3NpZ25fYWxsb2MgYXJlIHB1YmxpYwogPiAgICAg
ICBub3cgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBDKysgc3RhbmRhcmRzIGFuZCBvbGRl
ciBTVEwgdmVyc2lvbnM7CgogPiAgICAgLSBhZGRlZCBhIG5ldyBtZGJ4OjpkZWZhdWx0X2J1ZmZl
ciB0eXBlOwoKID4gICAgIC0gYWRkZWQgbWV0aG9kcyBmb3Igc2xpY2VzIGFuZCBidWZmZXJzIGhl
eF9kZWNvZGUoKSwgYmFzZTY0X2RlY29kZSgpLAogPiAgICAgICBiYXNlNThfZGVjb2RlKCk7Cgog
PiAgICAgLSBhZGRlZCB0eXBlIG1kYng6OmNvbXBhcmF0b3IoKSBhbmQgbWRieDo6ZGVmYXVsdF9j
b21wYXJhdG9yKCkgZnVuY3Rpb25zOwoKID4gICAgIC0gYWRkZWQgc3RhdGljIG1ldGhvZHMgYnVm
ZmVyOjpoZXgoKSwgYnVmZmVyOjpiYXNlNjQoKSwgYnVmZmVyOjpiYXNlNTgoKTsKCiA+ICAgICAt
IGFkZGVkIG1ldGhvZHMgZm9yIHRyYW5zYWN0aW9ucyBhbmQgY3Vyc29ycyBnZXQvc2V0X2NvbnRl
eHQoKTsKCiA+ICAgICAtIGFkZGVkIHRoZSBjdXJzb3I6OmNsb25lKCkgbWV0aG9kOwoKID4gICAg
IC0gaW1wbGVtZW50YXRpb24gb2YgYmFzZTU4IG5vdyBpcyBpbiBhY2NvcmRhbmNlIHdpdGggdGhl
IFJGQyBkcmFmdC4KCiA+IFRoZSBjb21wbGV0ZSBDaGFuZ2VMb2c6IGh0dHBzOi8vZ2l0ZmxpYy5y
dS9wcm9qZWN0L2VydGhpbmsvbGlibWRieC9ibG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCgogPiBTaWdu
ZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikgPGxlb0B5
dXJpZXYucnU+CgpDb21taXR0ZWQgdG8gMjAyNC4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
