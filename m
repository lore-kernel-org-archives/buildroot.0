Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D75C64EC4
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 09:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C1560A7B;
	Sat,  4 Mar 2023 09:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C1560A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wEJnlOn1_eam; Sat,  4 Mar 2023 09:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D3060A6B;
	Sat,  4 Mar 2023 09:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D3060A6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B61F1BF44C
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 09:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8F6741721
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 09:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F6741721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XokbsROzg14S for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 09:05:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A784171F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40A784171F
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 09:05:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 32B46240002;
 Sat,  4 Mar 2023 09:05:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYNpk-00Di8v-7N; Sat, 04 Mar 2023 10:05:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYp?=
 <leo@yuriev.ru>
References: <20230214155129.679711-1-leo@yuriev.ru>
Date: Sat, 04 Mar 2023 10:05:40 +0100
In-Reply-To: <20230214155129.679711-1-leo@yuriev.ru> (=?utf-8?B?ItCb0LU=?=
 =?utf-8?B?0L7QvdC40LQg0K7RgNGM0LXQsg==?= (Leonid
 Yuriev)"'s message of "Tue, 14 Feb 2023 18:51:29 +0300")
Message-ID: <87r0u4eviz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.14
 "Sergey Kapitsa"
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
cmVsZWFzZSBvZiBsaWJtZGJ4LAogPiBpbiBtZW1vcnkgb2YgU2VyZ2V5IEthcGl0c2EgKFJ1c3Np
YW4gcGh5c2ljaXN0IGFuZCBkZW1vZ3JhcGhlcikgb24gaGlzIDk1dGggYmlydGhkYXkuCgogPiBJ
dCBpcyByZWFzb25hYmxlIHRvIGJhY2twb3J0IHRoaXMgcGF0Y2ggdG8gYWxsIGFwcGxpY2FibGUg
cmVsZWFzZXMvYnJhbmNoZXMgb2YgQnVpbGRyb290LAogPiBhdCBsZWFzdCB0aGlzIHJlbGVhc2Ug
Zml4ZXMgYnVpbGQgZm9yIHNoNCBhcmNoLgoKID4gUmVsZWFzZSBub3RlcyBmb3IgdjAuMTEuMTQK
ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCiA+IEZpeGVzOgoKID4gIC0gYmFja3BvcnQ6
IFJlZmluZWQgdGhlIGBfX2NvbGRgL2BfX2hvdGAgbWFjcm9zIHRvIGF2b2lkIHRoZQogPiAgICBg
ZXJyb3I6IGlubGluaW5nIGZhaWxlZCBpbiBjYWxsIHRvIOKAmGFsd2F5c19pbmxpbmUgRk9PKC4u
LinigJk6IHRhcmdldCBzcGVjaWZpYyBvcHRpb24gbWlzbWF0Y2hgCiA+ICAgIGlzc3VlIGR1cmlu
ZyBidWlsZCB1c2luZyBHQ0MgPjEwLnggZm9yIFNINCBhcmNoLgogPiAgICBBY3R1YWxseSB0aGlz
IGlzIEdDQycgU0g0LWJhY2tlbmQgYnVnIHdoaWNoIHRyaWdnZXJlZCBieSB0aGUgYF9fYXR0cmli
dXRlX18oKF9fb3B0aW1pemVfXygiT3MiKSkpYAogPiAgICB1c2VkIGluIGNvbmp1bmN0aW9uIHdp
dGggdGhlIGBfX2F0dHJpYnV0ZV9fKChfX2NvbGRfXykpYC4KCiA+ICAtIGJhY2twb3J0OiBGaXhl
ZCBgU0lHU0VHVmAgb3IgYW4gZXJyb25lb3VzIGNhbGwgdG8gYGZyZWUoKWAgaW4gY2FzZSB3aGVy
ZQogPiAgICBlcnJvcnMgb2NjdXIgd2hlbiByZW9wZW5pbmcgYnkgYG1kYnhfZW52X29wZW4oKWAg
b2YgYSBwcmV2aW91c2x5IHVzZWQKID4gICAgZW52aXJvbm1lbnQuCgogPiAgLSBiYWNrcG9ydDog
Rml4ZWQgYGN1cnNvcl9wdXRfbm9jaGVja2xlbigpYCBpbnRlcm5hbHMgZm9yIGNhc2Ugd2hlbiBk
dXBzb3J0J2VkIG5hbWVkIHN1YkRiCiA+ICAgIGNvbnRhaW5zIGEgc2luZ2xlIGtleSB3aXRoIG11
bHRpcGxlIHZhbHVlcyAoYWthIGR1cGxpY2F0ZXMpLCB3aGljaCBhcmUgcmVwbGFjZWQKID4gICAg
d2l0aCBhIHNpbmdsZSB2YWx1ZSBieSBwdXQtb3BlcmF0aW9uIHdpdGggdGhlIGBNREJYX1VQU0VS
VCtNREJYX0FMTERVUFNgIGZsYWdzLgogPiAgICBJbiB0aGlzIGNhc2UsIHRoZSBkYXRhYmFzZSBi
ZWNvbWVzIGNvbXBsZXRlbHkgZW1wdHksIHdpdGhvdXQgYW55IHBhZ2VzLgogPiAgICBIb3dldmVy
IGV4YWN0bHkgdGhpcyBjb25kaXRpb24gd2FzIG5vdCBjb25zaWRlcmVkIGFuZCB0aHVzIHdhc24n
dCBoYW5kbGVkIGNvcnJlY3RseS4KID4gICAgU2VlIFtpc3N1ZSM4XShodHRwczovL2dpdGZsaWMu
cnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvaXNzdWUvOCkgZm9yIG1vcmUgaW5mb3JtYXRpb24u
CgogPiAgLSBiYWNrcG9ydDogRml4ZWQgZXh0cmEgYXNzZXJ0aW9uIGluc2lkZSBgb3ZlcnJpZGVf
bWV0YSgpYCwgd2hpY2ggY291bGQKID4gICAgbGVhZCB0byBmYWxzZS1wb3NpdGl2ZSBmYWlsaW5n
IG9mIHRoZSBhc3NlcnRpb24gaW4gYSBkZWJ1ZyBidWlsZHMgZHVyaW5nCiA+ICAgIERCIHJlY292
ZXJ5IGFuZC9vciBhdXRvLXJvbGxiYWNrLgoKID4gTWlub3JzOgoKID4gIC0gYmFja3BvcnQ6IEZp
eGVkIHR5cG9zLgogPiAgLSBiYWNrcG9ydDogUmVmaW5lZCBgY29uc3RgIGFuZCBgbm9leGNlcHRg
IGZvciBmZXcgQysrIEFQSSBtZXRob2RzLgogPiAgLSBiYWNrcG9ydDogUmVzb2x2ZSBmYWxzZS1w
b3Npcml2ZSBgdXNlZCB1bmluaXRpYWxpemVkYCB3YXJuaW5nIGZyb20gR0NDID4xMC54CiA+ICAg
IHdoaWxlIGJ1aWxkIGZvciBTSDQgYXJjaC4KID4gIC0gYmFja3BvcnQ6IEZpeGVkIGluc2lnbmlm
aWNhbnQgdHlwbyBvZiBgfHxgIGluc2lkZSBgI2lmYCBieXRlLW9yZGVyIGNvbmRpdGlvbi4KCiA+
IFRoZSBjb21wbGV0ZSBDaGFuZ2VMb2c6IGh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9qZWN0L2VydGhp
bmsvbGlibWRieC9ibG9iP2ZpbGU9Q2hhbmdlTG9nLm1kCgogPiBTaWduZWQtb2ZmLWJ5OiDQm9C1
0L7QvdC40LQg0K7RgNGM0LXQsiAoTGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+CgpDb21t
aXR0ZWQgdG8gMjAyMi4xMS54IGFuZCAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVy
IEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
