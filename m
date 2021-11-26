Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC86C433F5
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 19:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0BAE80DAF;
	Fri, 26 Nov 2021 19:18:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd7QkViHwZrl; Fri, 26 Nov 2021 19:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D81CD80C4D;
	Fri, 26 Nov 2021 19:18:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BF4A1BF3CB
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 19:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F00B380C2B
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 19:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PfgQnZR9FYr for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 19:18:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E7C80B95
 for <buildroot@buildroot.org>; Fri, 26 Nov 2021 19:18:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9746611D4;
 Fri, 26 Nov 2021 11:18:40 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.33.140])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADF803F7B4;
 Fri, 26 Nov 2021 11:18:39 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Fri, 26 Nov 2021 20:17:42 +0100
Message-Id: <20211126191742.22476-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next] package/fwts: bump to version 21.11.00
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
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxzbywgdXBkYXRlIHRoZSBoYXNoIG9mIHRoZSBjb3B5cmlnaHQgZmlsZSwgd2hpY2ggaGFzIGNo
YW5nZWQgKGJ5IG9uZQpjaGFyYWN0ZXIpLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOp
IDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogRXJpY28gTnVuZXMgPG51bmVzLmVyaWNvQGdt
YWlsLmNvbT4KLS0tCgoKSGksCgpJIGhhdmUgdGVzdGVkIHRoaXMgZnd0cyBzdWNjZXNzZnVsbHkg
b24gcWVtdSwgZm9yIGJvdGggNjRiIHg4NiBhbmQgQXJtLgoKQmVzdCByZWdhcmRzLApWaW5jZW50
LgoKCiBwYWNrYWdlL2Z3dHMvZnd0cy5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL2Z3dHMvZnd0cy5t
ayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9md3RzL2Z3dHMuaGFzaCBiL3BhY2thZ2UvZnd0cy9m
d3RzLmhhc2gKaW5kZXggZmM3OWEwYjgxMjUuLjg2MzQ5ODBlMDM2IDEwMDY0NAotLS0gYS9wYWNr
YWdlL2Z3dHMvZnd0cy5oYXNoCisrKyBiL3BhY2thZ2UvZnd0cy9md3RzLmhhc2gKQEAgLTEsNSAr
MSw1IEBACiAjIEhhc2ggZnJvbTogaHR0cDovL2Z3dHMudWJ1bnR1LmNvbS9yZWxlYXNlL1NIQTI1
NlNVTVMKLXNoYTI1NiAgZTJkNmU4YjA3MDRlYmE4NTlhNTY3ZmI4NzY0ZTVkYzUzODU3OTNmYzI2
YmQwMGVjYzcwZTdhZjAzZmQyNTY4ZCAgZnd0cy1WMjEuMDUuMDAudGFyLmd6CitzaGEyNTYgIDE3
ZDFmMGI5NjM5ZTBmOWIwOTJlZDgyMzNiZTJkNjNkNmM0NGVhOGQyYTc2YmUwZmI1OTAyY2M4Njc5
NjEzNzQgIGZ3dHMtVjIxLjExLjAwLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZQot
c2hhMjU2ICAyMDAzZjVjOGExZTQwZDc4ODJmMTQ5OWJkN2FkYjdiYzc0OGM5NjU2ODUxYWJiMjg2
NDdhM2QyOTdjMmU4ZTIzICBkZWJpYW4vY29weXJpZ2h0CitzaGEyNTYgIGZiYmVhNzQ4NTU1NjM1
ZGQ4YzdlNmUyZjk5Y2RkZDc3OGY1ZWUzZjllMzUxMDc3NTE4M2JmOTc5OTA3NmU1ZTUgIGRlYmlh
bi9jb3B5cmlnaHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnd0cy9md3RzLm1rIGIvcGFja2FnZS9m
d3RzL2Z3dHMubWsKaW5kZXggNDAyYTllMGI4ZmIuLjY2MzRjZGM0MGU2IDEwMDY0NAotLS0gYS9w
YWNrYWdlL2Z3dHMvZnd0cy5taworKysgYi9wYWNrYWdlL2Z3dHMvZnd0cy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUZXVFNfVkVSU0lPTiA9IDIxLjA1
LjAwCitGV1RTX1ZFUlNJT04gPSAyMS4xMS4wMAogRldUU19TT1VSQ0UgPSBmd3RzLVYkKEZXVFNf
VkVSU0lPTikudGFyLmd6CiBGV1RTX1NJVEUgPSBodHRwOi8vZnd0cy51YnVudHUuY29tL3JlbGVh
c2UKIEZXVFNfU1RSSVBfQ09NUE9ORU5UUyA9IDAKLS0gCjIuMzMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
