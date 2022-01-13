Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35120C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF8AA6FC76;
	Thu, 13 Jan 2022 21:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfxNKA6xNqJ5; Thu, 13 Jan 2022 21:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 430D56FC73;
	Thu, 13 Jan 2022 21:42:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 629001BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC0A6FC73
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b20PvL8tAAAc for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:42:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6008D6FC71
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:42:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5C528100002;
 Thu, 13 Jan 2022 21:42:53 +0000 (UTC)
Date: Thu, 13 Jan 2022 22:42:52 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20220113224252.0a46e30b@windsurf>
In-Reply-To: <20211021085540.18764-1-zajec5@gmail.com>
References: <20211021085540.18764-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/broadcom: add support for bcm47xx
 platform devices
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFmYcWCLAoKT24gVGh1LCAyMSBPY3QgMjAyMSAxMDo1NTo0MCArMDIwMApSYWZhxYIg
TWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gQnJvYWRjb20ncyBiY200N3h4IGlzIGEgZmFtaWx5
IG9mIE1JUFMgU29DcyBnb2luZyBiYWNrIHRvIHRoZSAyMDAyIGFuZAo+IGluY2x1ZGluZyBlLmcu
IExpbmtzeXMgV1JUNTRHIHdpdGggaXRzIEJDTTQ3MDIuIEl0IGV2b2x2ZWQgdGhyb3VnaCB5ZWFy
cwo+IGFuZCBpdHMgbGF0ZXN0IG1vZGVsIEJDTTQ3MDYgaXMgc3RpbGwgaW4gdXNlIG5vd2FkYXlz
Lgo+IAo+IFByZXR0eSBtdWNoIGFsbCBTb0NzIGNvbnRhaW4gYWxsIGZvbGxvd2luZyBjb21wb25l
bnRzOgo+IDEuIENQVQo+IDIuIFBDSWUgY29udHJvbGxlcihzKQo+IDMuIEV0aGVybmV0IGludGVy
ZmFjZShzKQo+IDQuIFVTQiBjb250cm9sbGVycwo+IDUuIFNlcmlhbCBmbGFzaCBjb250cm9sbGVy
Cj4gNi4gR1BJTyBjb250cm9sbGVyIChmb3IgTEVEcyBhbmQgYnV0dG9ucykKPiA3LiBXYXRjaGRv
Zwo+IAo+IFVwc3RyZWFtIGtlcm5lbCBpbmNsdWRlcyBhIHByZXR0eSBtdWNoIGNvbXBsZXRlIHN1
cHBvcnQgZm9yIGJjbTQ3eHggYnV0Cj4gaXQgaXNuJ3QgRFRTIGJhc2VkLiBCb2FyZCBkZXRlY3Rp
b24gaXMgaGFuZGxlZCBvbiBydW50aW1lIHNvIHRoZXJlIGlzCj4gb25lIGtlcm5lbCBpbWFnZSB0
byBzZXJ2ZSBhbGwuCj4gCj4gQm9vdGxvYWRlciB1c2VkIGluIHRob3NlIGRldmljZXMgaXMgQ0ZF
LiBJdCBhbGxvd3MgYm9vdGluZyBrZXJuZWwgb3Zlcgo+IHRmdHAgYW5kIGZsYXNoaW5nIGZpcm13
YXJlcyB1c2luZyBUUlggZm9ybWF0LiBJdCBpc24ndCBwcm9wZXJseSBvcGVuCj4gc291cmNlZCAo
ZXhjZXB0IHNvbWUgZWFybHkgdmVyc2lvbnMpIGFuZCBpbiBwcmFjdGljZSBpdCdzIGlycmVwbGFj
ZWFibGUuCj4gCj4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciBidWlsZGluZyBhIGJvb3Rh
YmxlIGtlcm5lbCBiYXNlZCBvbiA1LjQKPiBzdGFibGUgcmVsZWFzZToKPiBTdGFydGluZyBwcm9n
cmFtIGF0IDB4ODAwMDEwMDAKPiBMaW51eCB2ZXJzaW9uIDUuNC4xNTUgKHJtaWxlY2tpQGxvY2Fs
aG9zdC5sb2NhbGRvbWFpbikgKGdjYyB2ZXJzaW9uIDEwLjMuMCAoQnVpbGRyb290IDIwMjEuMDgt
OTMwLWdjMGM5MjU2MDVkKSkgIzUgVGh1IE9jdCAyMSAxMDoxNjoyMCBDRVNUIDIwMjEKPiAKPiBM
aW51eCA1LjEwIGRvZXNuJ3Qgc3RhcnQgYm9vdGluZyBkdWUgdG8gc29tZSByZWdyZXNzaW9uIHRo
YXQgcmVtYWlucyB0bwo+IGJlIGRlYnVnZ2VkLiBBZGRpbmcgc3VwcG9ydCBmb3IgYnVpbGRpbmcg
ZnVsbCBpbWFnZXMgKGluY2x1ZGluZyByb290ZnMpCj4gaXMgYWxzbyBwbGFubmVkIGZvciB0aGUg
ZnV0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPiAtLS0KPiAgYm9hcmQvYnJvYWRjb20vYmNtNDd4eC9saW51eC5jb25maWcgfCAyOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGNvbmZpZ3MvYnJvYWRjb21fYmNtNDd4eF9k
ZWZjb25maWcgIHwgIDggKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9icm9hZGNvbS9iY200N3h4L2xpbnV4LmNv
bmZpZwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9icm9hZGNvbV9iY200N3h4X2RlZmNv
bmZpZwoKVGhhbmtzIGZvciB0aGlzIGNvbnRyaWJ1dGlvbiwgYnV0IGl0IGRvZXNuJ3Qgc2VlbSB0
byBiZSByZWFsbHkgdXNlZnVsCmFzIGl0IGlzOiB0aGUgcm9vdCBmaWxlc3lzdGVtIGdlbmVyYXRl
ZCBhcyBhIHRhcmJhbGwgaXMgbm90IGV2ZW4gdXNlZCwKYW5kIHRoZXJlIGlzIG5vIHJlYWRtZS50
eHQuIFdlIHByZWZlciB0byBoYXZlIGRpcmVjdGx5IHVzZWZ1bCBkZWZjb25maWcKZmlsZXMuCgpC
ZXN0IHJlZ2FyZHMsCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpF
bWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
