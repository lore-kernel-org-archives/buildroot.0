Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B9AC7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E8741692;
	Tue, 13 Jun 2023 12:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E8741692
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYCR4XFM6ujt; Tue, 13 Jun 2023 12:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AE3240BA3;
	Tue, 13 Jun 2023 12:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AE3240BA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEB691BF352
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B876681FF9
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B876681FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QnfvDE5sxgVz for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:50:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 829B581FF6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 829B581FF6
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:50:14 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F9A140010;
 Tue, 13 Jun 2023 12:50:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q93TO-004NHm-GG; Tue, 13 Jun 2023 14:50:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230418105814.2982312-1-raphael.melotte@mind.be>
 <20230513195134.GF2582048@scaer>
Date: Tue, 13 Jun 2023 14:50:10 +0200
In-Reply-To: <20230513195134.GF2582048@scaer> (Yann E. MORIN's message of
 "Sat, 13 May 2023 21:51:34 +0200")
Message-ID: <87ilbrwmpp.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package: {,
 python-py}mupdf: bump to 1.22.0
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
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IFJhcGhhw6tsLCBBbGwsCiA+IE9uIDIwMjMtMDQtMTggMTI6NTggKzAyMDAsIFJh
cGhhw6tsIE3DqWxvdHRlIHNwYWtlIHRodXNseToKID4+IEFsc28gcmVtb3ZlIHRoZSBsYXN0IHR3
byAnKl9JR05PUkVfQ1ZFUycsIHNpbmNlIHRoZSBjb3JyZXNwb25kaW5nCiA+PiBwYXRjaGVzIGhh
dmUgYmVlbiByZW1vdmVkICh0aGV5IGFyZSBub3cgcGFydCBvZiB1cHN0cmVhbSkgaW4KID4+IDFm
YjY0NjgwYmZmYmRhMWU1ZmI5NTIxNTA2NTJmNzMyMDUzMjI3MDcuCiA+PiAKID4+IFNpZ25lZC1v
ZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KID4+IC0t
LQogPj4gcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoICAgICAgICAgICAgICAgICAgIHwgNCArKy0t
CiA+PiBwYWNrYWdlL211cGRmL211cGRmLm1rICAgICAgICAgICAgICAgICAgICAgfCA4ICstLS0t
LS0tCiA+PiBwYWNrYWdlL3B5dGhvbi1weW11cGRmL3B5dGhvbi1weW11cGRmLmhhc2ggfCA0ICsr
LS0KID4+IHBhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsgICB8IDQgKyst
LQogPj4gNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQog
Pj4gCiA+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoIGIvcGFja2FnZS9t
dXBkZi9tdXBkZi5oYXNoCiA+PiBpbmRleCBlZjkxYWJlZTE4Li4xZjYzNjA5N2VkIDEwMDY0NAog
Pj4gLS0tIGEvcGFja2FnZS9tdXBkZi9tdXBkZi5oYXNoCiA+PiArKysgYi9wYWNrYWdlL211cGRm
L211cGRmLmhhc2gKID4+IEBAIC0xLDggKzEsOCBAQAogPj4gIyBGcm9tIGh0dHBzOi8vbXVwZGYu
Y29tL2Rvd25sb2Fkcy9pbmRleC5odG1sOgogPj4gLXNoYTEgIGY3NTlkOTE0ZWM2YWQ2YTNiOTZm
OTk0NjMwZmY3MGI3NTgyMzgzMWIgIG11cGRmLTEuMjEuMS1zb3VyY2UudGFyLmx6CiA+PiArc2hh
MSAgYjk5MDc3MjlkNjA0ZjBiZjM4NDZiNDVjZDU4OTFlMTBkN2E2NmUyNCAgbXVwZGYtMS4yMi4w
LXNvdXJjZS50YXIubHoKID4+IAogPj4gIyBMb2NhbGx5IGNvbXB1dGVkOgogPj4gLXNoYTI1NiAg
NjZhNDM0OTA2NzZjN2Y3YzJmZjc0MDY3MzI4ZWYxMzI4NTUwNmZjYzc1OGQzNjVhZTI3ZWEzNjY4
YmQ1ZTYyMCAgbXVwZGYtMS4yMS4xLXNvdXJjZS50YXIubHoKID4+ICtzaGEyNTYgIGJlZDc4YTBh
YmY4NDk2YjMwYzUyMzQ5NzI5MmRlOTc5ZGI2MzNlY2E1N2UwMmY2Y2QwZjNjN2MwNDI1NTFjM2Ug
IG11cGRmLTEuMjIuMC1zb3VyY2UudGFyLmx6CiA+PiAKID4+ICMgSGFzaCBmb3IgbGljZW5zZSBm
aWxlczoKID4+IHNoYTI1NiAgNTdjOGZmMzNjOWMwY2ZjM2VmMDBlNjUwYTFjYzkxMGQ3ZWU0Nzlh
OGJjNTA5ZjZjOTIwOWE3YzJhMTEzOTlkNiAgQ09QWUlORwogPj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbXVwZGYvbXVwZGYubWsgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCiA+PiBpbmRleCBkNmNj
NDA3YzQ5Li4wODg5NGQ3OTgwIDEwMDY0NAogPj4gLS0tIGEvcGFja2FnZS9tdXBkZi9tdXBkZi5t
awogPj4gKysrIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawogPj4gQEAgLTUsNyArNSw3IEBACiA+
PiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogPj4gCiA+PiAjIHB5dGhvbi1weW11cGRmJ3MgdmVy
c2lvbiBtdXN0IG1hdGNoIG11cGRmJ3MgdmVyc2lvbgogPj4gLU1VUERGX1ZFUlNJT04gPSAxLjIx
LjEKID4+ICtNVVBERl9WRVJTSU9OID0gMS4yMi4wCiA+PiBNVVBERl9TT1VSQ0UgPSBtdXBkZi0k
KE1VUERGX1ZFUlNJT04pLXNvdXJjZS50YXIubHoKID4+IE1VUERGX1NJVEUgPSBodHRwczovL211
cGRmLmNvbS9kb3dubG9hZHMvYXJjaGl2ZQogPj4gTVVQREZfTElDRU5TRSA9IEFHUEwtMy4wKwog
Pj4gQEAgLTIyLDEyICsyMiw2IEBAIE1VUERGX0RFUEVOREVOQ0lFUyA9IFwKID4+IHhsaWJfbGli
WDExIFwKID4+IHpsaWIKID4+IAogPj4gLSMgMDAwMi1CdWctNzAzMzY2LUZpeC1kb3VibGUtZnJl
ZS1vZi1vYmplY3QtZHVyaW5nLWxpbmVhcml6YXRpb24ucGF0Y2gKID4+IC1NVVBERl9JR05PUkVf
Q1ZFUyArPSBDVkUtMjAyMS0zNDA3CiA+PiAtCiA+PiAtIyAwMDAzLUJ1Zy03MDM3OTEtU3RheS13
aXRoaW4taGFzaC10YWJsZS1tYXgta2V5LXNpemUtaW4tY2FjaGVkLWNvbG9yLWNvbnZlcnRlci5w
YXRjaAogPj4gLU1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDIxLTM3MjIwCgogPiBEcm9wcGlu
ZyB0aG9zZSBleGNsdXNpb24gc2hvdWxkIGhhdmUgYmVlbiBpbiBhIHNlYXByYXRlIHBhdGNoLCBi
ZWNhdXNlCiA+IHRoZXkgd2VyZSBhbHJlYWR5dSBpbmNvcnJlY3QgZXZlbiBiZWZvcmUgdGhlIGJ1
bXAgdG8gMS4yMi4wICh3ZSBubwogPiBsb25nZXIgaGF2ZSB0aG9zZSB0d28gcGF0Y2hlcykuCgog
PiBTbywgSSBzcGxpdCB0aGF0IGludG8gaXRzIG93biBwYXRjaC4KCkNvbW1pdHRlZCB0aGUgZHJv
cC1DVkUtaWdub3JlIHBhcnQgdG8gMjAyMy4wMi54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBL
b3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
