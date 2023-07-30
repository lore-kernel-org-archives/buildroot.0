Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89479EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 08:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA46410D8;
	Sun, 30 Jul 2023 08:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA46410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nST3nL8d50Rd; Sun, 30 Jul 2023 08:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D79E6410E0;
	Sun, 30 Jul 2023 08:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D79E6410E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B61051BF427
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 08:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EB1D60AAE
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 08:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EB1D60AAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgYubJKLQdCs for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 08:18:59 +0000 (UTC)
Received: from mx1.sonologic.net (mx1.sonologic.nl
 [IPv6:2a01:4f8:121:43cd::1:9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C24CD60A7F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 08:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C24CD60A7F
Received-SPF: pass (mx1.sonologic.net: authenticated connection)
 receiver=mx1.sonologic.net; client-ip=178.63.120.221; helo=[10.1.3.70];
 envelope-from=kmartens@sonologic.se;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.11; 
Received: from [10.1.3.70] (portal.sonologic.net [178.63.120.221])
 (authenticated bits=0)
 by mx1.sonologic.net (8.17.1/8.16.1) with ESMTPSA id 36U8IrPK021413
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sun, 30 Jul 2023 08:18:54 GMT (envelope-from kmartens@sonologic.se)
X-Authentication-Warning: mx1.sonologic.net: Host portal.sonologic.net
 [178.63.120.221] claimed to be [10.1.3.70]
Message-ID: <f3596365-41b7-0248-0801-ee62edc0c2e5@metro.cx>
Date: Sun, 30 Jul 2023 10:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <eee5a213-c0d0-c400-227e-fe3df1c941a4@sonologic.se>
 <20230728223552.36535b1f@windsurf>
From: Koen Martens <kmartens@sonologic.se>
In-Reply-To: <20230728223552.36535b1f@windsurf>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (mx1.sonologic.net [178.63.120.202]); Sun, 30 Jul 2023 08:18:55 +0000 (UTC)
Subject: Re: [Buildroot] [PATCH 1/1] package/capnproto: bump version to
 0.10.4
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKTXkgYXBvbG9naWVzLiBJdCBpc24ndCBvZnRlbiB0aGF0IEknbSBjb250cmli
dXRpbmcgb24gYSBwcm9qZWN0IHRoYXQgCnN0aWxsIHVzZXMgZW1haWwgZm9yIHNlbmRpbmcgYXJv
dW5kIHBhdGNoZXMsIHNvIGV2ZXJ5IHRpbWUgSSBoYXZlIHRvIApyZWRpc2NvdmVyIHRoZSBpbnRy
aWNhY2llcyBvZiB0aGlzIHBhcnRpY3VsYXIgd29ya2Zsb3cuIEknbGwgdHJ5IGFuZCBwYXkgCm1v
cmUgYXR0ZW50aW9uIG5leHQgdGltZSEKCmdpdCBzZW5kLWVtYWlsIHNhZGx5IHdvbid0IHdvcmsg
b3V0IG9mIHRoZSBib3ggZm9yIG1lLCBldmVuIGFmdGVyIEkgCmluc3RhbGwgdGhlIG9wdGlvbmFs
IHBhY2thZ2VzLCBiZWNhdXNlIG9mIElTUCByZXN0cmljdGlvbnMuIEknbGwgc2VlIGlmIApJIGNh
biBmaW5kIHNvbWUgdGltZSB0byBmaWd1cmUgb3V0IGFsbCB0aGUgcmVxdWlyZWQgb3B0aW9ucyBm
b3IgaXQgdG8gCnNlbmQgb3V0IHRocm91Z2ggbXkgbWFpbCBzZXJ2ZXIuCgpDaGVlcnMsCgpLb2Vu
CgpPbiAyMDIzLTA3LTI4IDIyOjM1LCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvIEtv
ZW4sCj4KPiBPbiBNb24sIDI0IEp1bCAyMDIzIDE0OjQyOjA4ICswMjAwCj4gS29lbiBNYXJ0ZW5z
IDxrbWFydGVuc0Bzb25vbG9naWMuc2U+IHdyb3RlOgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEtvZW4g
TWFydGVucyA8Z21jQHNvbm9sb2dpYy5ubD4KPj4gLS0tCj4+ICAgwqBwYWNrYWdlL2NhcG5wcm90
by9jYXBucHJvdG8uaGFzaCB8IDIgKy0KPj4gICDCoHBhY2thZ2UvY2FwbnByb3RvL2NhcG5wcm90
by5ta8KgwqAgfCAyICstCj4+ICAgwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiBZb3VyIHBhdGNoIHdhcyBsaW5lLXdyYXBwZWQsIHNvIGl0IGNvdWxk
bid0IGJlIGFwcGxpZWQgYXMtaXMuIENvdWxkIHlvdQo+IHRyeSB0byB1c2UgImdpdCBzZW5kLWVt
YWlsIiBmb3IgeW91ciBuZXh0IHBhdGNoZXM/Cj4KPiBBcyB0aGUgcGF0Y2ggd2FzIHRyaXZpYWws
IEkgZml4ZWQgdGhpbmdzIHVwIG1hbnVhbGx5IGFuZCBhcHBsaWVkLCBidXQKPiBpdCB3b3VsZCBi
ZSBhbm5veWluZyB0byBkbyBvbiBhIG1vcmUgY29tcGxpY2F0ZWQgcGF0Y2guCj4KPiBUaGFua3Mg
Zm9yIHlvdXIgY29udHJpYnV0aW9uIQo+Cj4gVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
