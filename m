Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD3CC77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 06:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30B8817B3;
	Tue,  2 May 2023 06:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30B8817B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prd9W9PXeHMW; Tue,  2 May 2023 06:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33E3A813E8;
	Tue,  2 May 2023 06:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33E3A813E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 609EC1BF3C6
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 06:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47819813E8
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 06:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47819813E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jc3pzhiXy3QG for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 06:29:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 176D3813AF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 176D3813AF
 for <buildroot@busybox.net>; Tue,  2 May 2023 06:29:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A0751C0008;
 Tue,  2 May 2023 06:29:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ptjVc-0072V4-Nz; Tue, 02 May 2023 08:29:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230429200133.152499-1-francois.perrad@gadz.org>
 <20230501195805.GD2696@scaer>
Date: Tue, 02 May 2023 08:29:08 +0200
In-Reply-To: <20230501195805.GD2696@scaer> (Yann E. MORIN's message of "Mon, 1
 May 2023 21:58:05 +0200")
Message-ID: <87a5ynckln.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/lua: bump to version 5.4.5
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IEZyYW7Dp29pcywgQWxsLAogPiBPbiAyMDIzLTA0LTI5IDIyOjAxICswMjAwLCBG
cmFuY29pcyBQZXJyYWQgc3Bha2UgdGh1c2x5OgogPj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMg
UGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+CiA+PiAtLS0KID4+IHBhY2thZ2UvbHVh
LzUuNC40L2x1YS5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNiAtLS0t
LS0KID4+IHBhY2thZ2UvbHVhL3s1LjQuNCA9PiA1LjQuNX0vMDAwMS1yb290LXBhdGgucGF0Y2gg
ICAgICAgICAgIHwgMiArLQogPj4gcGFja2FnZS9sdWEvezUuNC40ID0+IDUuNC41fS8wMDAyLXNo
YXJlZC1saWJzLWZvci1sdWEucGF0Y2ggfCAyICstCiA+PiBwYWNrYWdlL2x1YS97NS40LjQgPT4g
NS40LjV9LzAwMTEtbGluZW5vaXNlLnBhdGNoICAgICAgICAgICB8IDIgKy0KCiA+IFRoaXMgY2F1
c2VzIGNoZWNrLXBhY2thZ2UgZmFpbHVyZXM6CgogPiAgICAgJCBtYWtlIGNoZWNrLXBhY2thZ2UK
ID4gICAgIHBhY2thZ2UvbHVhLzUuNC41LzAwMDEtcm9vdC1wYXRoLnBhdGNoOjA6IG1pc3Npbmcg
VXBzdHJlYW0gaW4gdGhlCiA+IGhlYWRlciAoaHR0cDovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8j
X2FkZGl0aW9uYWxfcGF0Y2hfZG9jdW1lbnRhdGlvbikKID4gICAgIHBhY2thZ2UvbHVhLzUuNC41
LzAwMDItc2hhcmVkLWxpYnMtZm9yLWx1YS5wYXRjaDowOiBtaXNzaW5nCiA+IFVwc3RyZWFtIGlu
IHRoZSBoZWFkZXIKID4gKGh0dHA6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19hZGRpdGlvbmFs
X3BhdGNoX2RvY3VtZW50YXRpb24pCiA+ICAgICBwYWNrYWdlL2x1YS81LjQuNS8wMDExLWxpbmVu
b2lzZS5wYXRjaDowOiBtaXNzaW5nIFVwc3RyZWFtIGluIHRoZQogPiBoZWFkZXIgKGh0dHA6Ly9u
aWdodGx5LmJ1aWxkcm9vdC5vcmcvI19hZGRpdGlvbmFsX3BhdGNoX2RvY3VtZW50YXRpb24pCiA+
ICAgICAzODQxNDAgbGluZXMgcHJvY2Vzc2VkCiA+ICAgICAzIHdhcm5pbmdzIGdlbmVyYXRlZAoK
WWVzLCB0aG9zZSAoZXhpc3RpbmcpIHBhdGNoZXMgZG9uJ3QgaGF2ZSBhbiB1cHN0cmVhbSB0YWcu
CgogPiBJJ3ZlIHB1c2hlZCBhIGZpeC11cCBjb21taXQsIDY2ZDNlNzRkOTRmOCAoLmNoZWNrcGFj
a2FnZWlnbm9yZToKID4gcmVnZW5lcmF0ZSBsaXN0KQoKVGhhbmtzISBTb3JyeSwgSSdsbCB0cnkg
dG8gcmVtZW1iZXIgdG8gcnVuIG1ha2UgLmNoZWNrcGFja2FnZWlnbm9yZQpiZWZvcmUgZWFjaCBw
dXNoLiBBbm5veWluZyB0aGF0IGl0IGlzIHNvIChyZWxhdGl2ZWx5KSBzbG93IDovCgotLSAKQnll
LCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
