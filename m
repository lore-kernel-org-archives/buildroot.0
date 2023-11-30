Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA8C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 08:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9726F4A8;
	Thu, 30 Nov 2023 08:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9726F4A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxeNXE_4lO7J; Thu, 30 Nov 2023 08:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0F1D61B3A;
	Thu, 30 Nov 2023 08:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0F1D61B3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC4991BF3BC
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FCF641551
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 08:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FCF641551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h6Uf1P6tiQ5s for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 08:16:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09F6A40490
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F6A40490
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21F38240004
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 08:16:18 +0000 (UTC)
Message-ID: <3d7d0402-ea2b-4192-bc69-54349909296f@korsgaard.com>
Date: Thu, 30 Nov 2023 09:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231126162001.07F85873CE@busybox.osuosl.org>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231126162001.07F85873CE@busybox.osuosl.org>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/zfs: don't download patch
 generated from github
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMTEvMjAyMyAxNy4xOSwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBjb21taXQ6IGh0dHBz
Oi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9MmMzOTQ2ZmNiNDViMDdk
YjVjYzg4Y2RjOTQ0NzQ1YWExZWY4ZmEwNAo+IGJyYW5jaDogaHR0cHM6Ly9naXQuYnVpbGRyb290
Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL21hc3Rlcgo+IAo+IEdpdC1nZW5l
cmF0ZWQgcGF0Y2hlcyBlbWJlZCB0aGUgc2hvcnQtaGFzaCBvZiB0aGUgb2JqZWN0cyBpbiB0aGUK
PiByZXBvc2l0b3J5LiBUaGUgbGVuZ3RoIG9mIHRob3NlIHNob3J0IGhhc2hlcyBhcmUgc3ViamVj
dCB0byBjaGFuZ2UKPiBpbiBhdCBsZWFzdCB0aHJlZSBjYXNlczoKPiAKPiAgICAtIHRoZSBudW1i
ZXIgb2Ygb2JqZWN0cyBpbiB0aGUgcmVwb3NpdG9yeSBpbmNyZWFzZXMsIHNvIGdpdCBpbmNyZWFz
ZXMKPiAgICAgIHRoZSBsZW5ndGggb2Ygc2hvcnQgaGFzaGVzIHRvIGdldCBhIGdvb2QgY2hhbmdl
IHRoZXJlIGlzIG5vCj4gICAgICBjb2xsaXNpb247Cj4gCj4gICAgLSB0aGUgZ2l0IGNvbmZpZ3Vy
YXRpb24gY2hhbmdlcywgc2VlIGNvcmUuYWJicmV2IGluIGdpdC1jb25maWc7Cj4gCj4gICAgLSB0
aGUgaGV1cmlzdGljIHRvIGNvbXB1dGUgdGhlIGxlbmd0aCBjaGFuZ2VzIGluIGEgbmV3ZXIgZ2l0
IHZlcnNpb24uCj4gCj4gU2luY2UgdGhlIGJ1bXAgdG8gemZzIDIuMS40IGluIGNvbW1pdCA2OGRm
ZDA5NzA4YzYsIHRoZSBwYXRjaCBnZW5lcmF0ZWQKPiBieSBnaXRodWIgaGFzIGNoYW5nZWQsIGNh
dXNpbmcgZG93bmxvYWQgZmFpbHVyZXM6Cj4gCj4gICAgICB3Z2V0IC0tcGFzc2l2ZS1mdHAgLW5k
IC10IDMgLU8gJy9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vbWFzdGVyL2J1aWxkLy5iYzNm
MTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoLnVvRnE5ZS9vdXRwdXQn
ICdodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvY29tbWl0L2JjM2YxMmJmYWMxNTJhMGMy
ODk1MWNlYzkyMzQwYmExNGY5Y2NlZTkucGF0Y2gnCj4gICAgICAtLTIwMjMtMTEtMjYgMTY6NTM6
MjUtLQo+ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2NvbW1pdC9iYzNmMTJi
ZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoCj4gICAgICBSZXNvbHZpbmcg
Z2l0aHViLmNvbSAoZ2l0aHViLmNvbSkuLi4gMTQwLjgyLjEyMS4zCj4gICAgICBDb25uZWN0aW5n
IHRvIGdpdGh1Yi5jb20gKGdpdGh1Yi5jb20pfDE0MC44Mi4xMjEuM3w6NDQzLi4uICBjb25uZWN0
ZWQuCj4gICAgICBIVFRQIHJlcXVlc3Qgc2VudCwgYXdhaXRpbmcgcmVzcG9uc2UuLi4gMjAwIE9L
Cj4gICAgICBMZW5ndGg6IDI5NzYgKDIuOUspIFt0ZXh0L3BsYWluXQo+ICAgICAgU2F2aW5nIHRv
OiDigJgvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC8uYmMzZjEyYmZh
YzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaC51b0ZxOWUvb3V0cHV04oCZCj4g
Cj4gICAgICAvaG9tZS95bW9yaW4vZGV2L2J1aWxkcm9vdC9PLyAxMDAlWz09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT5dICAgMi45MUsgLS0uLUtCL3MgaW4g
MHMKPiAKPiAgICAgIDIwMjMtMTEtMjYgMTY6NTM6MjUgKDE1LjAgTUIvcykgLSDigJgvaG9tZS95
bW9yaW4vZGV2L2J1aWxkcm9vdC9PL21hc3Rlci9idWlsZC8uYmMzZjEyYmZhYzE1MmEwYzI4OTUx
Y2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaC51b0ZxOWUvb3V0cHV04oCZIHNhdmVkIFsyOTc2LzI5
NzZdCj4gCj4gICAgICBFUlJPUjogd2hpbGUgY2hlY2tpbmcgaGFzaGVzIGZyb20gcGFja2FnZS96
ZnMvL3pmcy5oYXNoCj4gICAgICBFUlJPUjogYmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBi
YTE0ZjljY2VlOS5wYXRjaCBoYXMgd3Jvbmcgc2hhMjU2IGhhc2g6Cj4gICAgICBFUlJPUjogZXhw
ZWN0ZWQ6IDk2YTI3MzUzZmU3MTdmZjJjOGI5NWRlYjhiMDA5YzRlYjc1MDMwM2M2NDAwZTJkOGEy
NTgyYWIxZWMxMmIyNWEKPiAgICAgIEVSUk9SOiBnb3QgICAgIDogMjQ2YzgwZjY2YWJjYTVhN2Uw
YzQxY2M3YzU2ZWVjMGI0Y2I3ZjE2YjE0MjI2MjQ4MDQwMTE0MmJiYzJmOTk5Zgo+ICAgICAgRVJS
T1I6IEluY29tcGxldGUgZG93bmxvYWQsIG9yIG1hbi1pbi10aGUtbWlkZGxlIChNSVRNKSBhdHRh
Y2sKPiAKPiBBbmQgaW5kZWVkLCB0aGUgbGVuZ3RoIG9mIHNob3J0IGhhc2hlcyBoYXMgaW5jcmVh
c2VkIGJ5IG9uZSBzaW5jZSB0aGVuLgo+IAo+IEZpeCB0aGF0IGJ5IGJ1bmRsaW5nIHRoZSBwYXRj
aCwgd2l0aCB0aGUgc2hvcnQgaGFzaGVzIHRoYXQgd2VyZSBrbm93bgo+IHRoZW4sIHNvIHRoYXQg
aXQgbWF0Y2hlcyB0aGUgc2hhMjU2IHdlIGhhZCBmb3IgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
WWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CgpDb21taXR0ZWQgdG8gMjAy
My4wMi54IGFuZCAyMDIzLjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
