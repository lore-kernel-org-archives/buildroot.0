Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C722C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 15:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E150D418C3;
	Sun,  7 May 2023 15:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E150D418C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGNQ4dT80se8; Sun,  7 May 2023 15:07:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD95415FD;
	Sun,  7 May 2023 15:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD95415FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E45B1BF2F7
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AC9415FD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 15:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AC9415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xv1t8ArxxM3L for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 15:07:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32191410B1
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32191410B1
 for <buildroot@uclibc.org>; Sun,  7 May 2023 15:07:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1pvfyd-0000MB-9F
 for buildroot@uclibc.org; Sun, 07 May 2023 17:07:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 May 2023 17:06:51 +0200
Message-ID: <pan$8f26f$e0484769$516297af$9e67e51c@ID-313208.user.individual.net>
References: <20230506160524.2231307-1-bernd.kuhls@t-online.de>
 <20230506160524.2231307-2-bernd.kuhls@t-online.de>
 <20230507105218.GH252090__6425.69195931486$1683456775$gmane$org@scaer>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH v2 2/2] package/transmission: bump version
 to 4.0.3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gU3VuLCA3IE1heSAyMDIzIDEyOjUyOjE4ICswMjAwIHNjaHJpZWIgWWFubiBFLiBNT1JJTjoK
Cj4+IFJlbW92ZWQgdGhlIG9wdGlvbiB0byBkaXNhYmxlIHVUUCBzdXBwb3J0LCBmb3IgZGV0YWls
cyBzZWUgdXBzdHJlYW0gCmlzc3VlOgo+PiBodHRwczovL2dpdGh1Yi5jb20vdHJhbnNtaXNzaW9u
L3RyYW5zbWlzc2lvbi9pc3N1ZXMvNDc1MQo+IAo+IFRoZSBvcHRpb24gaXMgc3RpbGwgcHJlc2Vu
dCwgc28gd2h5IHdvdWxkIHdlIHdhbnQgdG8gcmVtb3ZlIGl0Pwo+IAo+ICAgICBodHRwczovL2dp
dGh1Yi5jb20vdHJhbnNtaXNzaW9uL3RyYW5zbWlzc2lvbi9ibG9iL21haW4vCkNNYWtlTGlzdHMu
dHh0Cj4gICAgIDU3ICBvcHRpb24oRU5BQkxFX1VUUCAiQnVpbGQgwrVUUCBzdXBwb3J0IiBPTikK
CkhpIFlhbm4sCgpiZWNhdXNlIGJ1aWxkaW5nIHdpdGhvdXQgdXRwIHN1cHBvcnQgaXMgYnJva2Vu
OgoKLS0gQ29uZmlndXJpbmcgZG9uZQpDTWFrZSBFcnJvciBhdCBsaWJ0cmFuc21pc3Npb24vQ01h
a2VMaXN0cy50eHQ6MjczICh0YXJnZXRfbGlua19saWJyYXJpZXMpOgogIFRhcmdldCAidHJhbnNt
aXNzaW9uIiBsaW5rcyB0bzoKCiAgICBsaWJ1dHA6OmxpYnV0cAoKICBidXQgdGhlIHRhcmdldCB3
YXMgbm90IGZvdW5kLiAgUG9zc2libGUgcmVhc29ucyBpbmNsdWRlOgoKbGlidXRwIGlzIHJlcXVp
cmVkIGJ5IGh0dHBzOi8vZ2l0aHViLmNvbS90cmFuc21pc3Npb24vdHJhbnNtaXNzaW9uL2Jsb2Iv
CjBkM2IzMjFiYWNhMmNkMDJjYzRiMjAxODI2YWVkMmI0ODVlMzdjM2YvbGlidHJhbnNtaXNzaW9u
LwpDTWFrZUxpc3RzLnR4dCNMMjg1CgpUaGlzIHdhcyBkaXNjdXNzZWQgdXBzdHJlYW0gaW4gdGhl
IGZvcmVtZW50aW9uZWQgaXNzdWUgNDc1MQpodHRwczovL2dpdGh1Yi5jb20vdHJhbnNtaXNzaW9u
L3RyYW5zbWlzc2lvbi9pc3N1ZXMvCjQ3NTEjaXNzdWVjb21tZW50LTE0NjQyODQ1ODUKIi4uLiBi
dXQgYXMgYSBwcmFjdGljYWwgbWF0dGVyLCBubyBkaXN0cm9zIGFyZSBnb2luZyB0byBkaXNhYmxl
IFVUUCAKc3VwcG9ydC4gU28gSSBkb24ndCBzZWUgYW4gYXVkaWVuY2UgZm9yIHRoaXMgYnVpbGQg
b3B0aW9uLiIKCkdldHRpbmcgcmlkIG9mIHRoZSBsaWJ1dHAgZGVwZW5kZW5jeSBpbiBsaWJ0cmFu
c21pc3Npb24gd2FzIHJlamVjdGVkIGJ0dzoKaHR0cHM6Ly9naXRodWIuY29tL3RyYW5zbWlzc2lv
bi90cmFuc21pc3Npb24vcHVsbC80ODgyLwoKUmVnYXJkcywgQmVybmQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
