Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C7CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 16:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D73405D2;
	Mon, 28 Feb 2022 16:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1j0KZuQ-KEPJ; Mon, 28 Feb 2022 16:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38E2A405CE;
	Mon, 28 Feb 2022 16:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D68481BF307
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 16:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9BA4405CD
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 16:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vk1GO1ah5nj1 for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 16:32:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A21401F8
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 16:32:58 +0000 (UTC)
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FDBEE000D;
 Mon, 28 Feb 2022 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646065977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UH9zndt/PtSupZRYokWVYI68fgiPkJFW7hNM9LQ8IFI=;
 b=Y4RLcIRwHEgPT3pBfA/V/MWMkUjVE/IhjZSudMJwCgMNqeLeLp61ERNhT4gOIpFE2HT7Sn
 t5enC9T0RRU5tHI4qEpqWM3Bwfo+xBisuHD/gMqRzqL2BxVOA8+RJrzGq2CSq+oL6skMNb
 0ZMgNm729EsqcdOLVlZ316pwiv0O7lOtOFNZvo7lffLlukZ+5in8CcVNIk1h0ul2iCo9sR
 S77rxyud1Qh2DH0TBLzHHYJ4DVqot2/JM8KCic974ln2vMT3qAlCPNb5E7W4wjGUpHH3Wl
 H70O6RHrYHFTzKiFJBhJ9yeD1oVVHRledepk0pyLtJIMYOF8HE4qBO2LNMkmNA==
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 17:32:38 +0100
Message-Id: <20220228163238.405627-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] docs: fix links to AsciiDoc
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGlua3Mgd2VyZSBhaW1lZCBhdCB0aGUgbWV0aG9kcy5jby5ueiBkb21haW4sIHdoaWNoIGlzIG5v
dyByZXR1cm5pbmcKNDA0cy4gVGhlIGN1cnJlbnQgc2l0dWF0aW9uIG9mIEFzY2lpRG9jIGlzIHVu
Y2xlYXIgdG8gbWU6IHRoZSBGZWRvcmEKcGFja2FnZSBwb2ludHMgdG8gdGhpcyB3ZWJzaXRlLCB0
aGV5IG93biBhc2NpaWRvYy5vcmcsIFdpa2lwZWRpYSBwb2ludHMKdG8gdGhpcyBwcm9qZWN0IGFz
IHdlbGwgYnV0IHRoZWlyIEdpdCByZXBvJ3MgUkVBRE1FIGluY2x1ZGVzIHRoZQpmb2xsb3dpbmcg
cGFyYWdyYXBoOgoKPiBBc2NpaURvYy5weSBpcyBhIGxlZ2FjeSBwcm9jZXNzb3IgZm9yIHRoaXMg
c3ludGF4LCBoYW5kbGluZyBhbiBvbGRlcgo+IHJlbmRpdGlvbiBvZiBBc2NpaURvYy4gQXMgc3Vj
aCwgdGhpcyB3aWxsIG5vdCBwcm9wZXJseSBoYW5kbGUgdGhlCj4gY3VycmVudCBBc2NpaURvYyBz
cGVjaWZpY2F0aW9uLiBJdCBpcyBzdWdnZXN0ZWQgdGhhdCB1bmxlc3MgeW91Cj4gc3BlY2lmaWNh
bGx5IHJlcXVpcmUgdGhlIEFzY2lpRG9jLnB5IHRvb2xjaGFpbiwgeW91IHNob3VsZCBmaW5kIGEK
PiBwcm9jZXNzb3IgdGhhdCBoYW5kbGVzIHRoZSBtb2Rlcm4gQXNjaWlEb2Mgc3ludGF4LgotLS0g
aHR0cHM6Ly9naXRodWIuY29tL2FzY2lpZG9jLXB5L2FzY2lpZG9jLXB5L2Jsb2IvMTAuMS4zL1JF
QURNRS5tZAoKIkFzY2lpRG9jIHNwZWNpZmljYXRpb24iIHBvaW50aW5nIHRvd2FyZHM6Cmh0dHBz
Oi8vcHJvamVjdHMuZWNsaXBzZS5vcmcvcHJvamVjdHMvYXNjaWlkb2MuYXNjaWlkb2MtbGFuZwoK
U2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KLS0t
CiBkb2NzL2NvbmYvYXNjaWlkb2MtdGV4dC5jb25mICB8IDIgKy0KIGRvY3MvbWFudWFsL3dyaXRp
bmctcnVsZXMudHh0IHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL2NvbmYvYXNjaWlkb2MtdGV4dC5jb25m
IGIvZG9jcy9jb25mL2FzY2lpZG9jLXRleHQuY29uZgppbmRleCA0NzBiZGVjZmMyLi5iYjYxNGI5
ZDg1IDEwMDY0NAotLS0gYS9kb2NzL2NvbmYvYXNjaWlkb2MtdGV4dC5jb25mCisrKyBiL2RvY3Mv
Y29uZi9hc2NpaWRvYy10ZXh0LmNvbmYKQEAgLTEsNSArMSw1IEBACiAjIFJlZmVyIHRvIGZvbGxv
d2luZyBhc2NpaWRvYyBkb2N1bWVudGF0aW9uOgotIyAgICAgaHR0cDovL3d3dy5tZXRob2RzLmNv
Lm56L2FzY2lpZG9jL3VzZXJndWlkZS5odG1sCisjICAgICBodHRwczovL2FzY2lpZG9jLXB5Lmdp
dGh1Yi5pby91c2VyZ3VpZGUuaHRtbAogIyBJbiBwYXJ0aWN1bGFyIHNlY3Rpb25zICJNYWNyb3Mi
IGFuZCAiQXR0cmlidXRlIFJlZmVyZW5jZXMiCiAjCiAjIEZvciBoeXBlcmxpbmtzLCBzaG93ICds
aW5rIHRleHQgW1VSTF0nIChpZiBsaW5rIHRleHQgcHJvdmlkZWQpIG9yICdVUkwnCmRpZmYgLS1n
aXQgYS9kb2NzL21hbnVhbC93cml0aW5nLXJ1bGVzLnR4dCBiL2RvY3MvbWFudWFsL3dyaXRpbmct
cnVsZXMudHh0CmluZGV4IDU3YmE2MWJkYjEuLjg0ZDhmNzY0MzEgMTAwNjQ0Ci0tLSBhL2RvY3Mv
bWFudWFsL3dyaXRpbmctcnVsZXMudHh0CisrKyBiL2RvY3MvbWFudWFsL3dyaXRpbmctcnVsZXMu
dHh0CkBAIC0yMDcsMTAgKzIwNywxMCBAQCBodHRwczovL2dpdGh1Yi5jb20vcGVuZ3V0cm9uaXgv
Z2VuaW1hZ2UvYmxvYi9tYXN0ZXIvUkVBRE1FLnJzdFtdLgogPT09IFRoZSBkb2N1bWVudGF0aW9u
CiAKIFRoZSBkb2N1bWVudGF0aW9uIHVzZXMgdGhlCi1odHRwOi8vd3d3Lm1ldGhvZHMuY28ubnov
YXNjaWlkb2MvW2FzY2lpZG9jXSBmb3JtYXQuCitodHRwczovL2FzY2lpZG9jLXB5LmdpdGh1Yi5p
by9bYXNjaWlkb2NdIGZvcm1hdC4KIAogRm9yIGZ1cnRoZXIgZGV0YWlscyBhYm91dCB0aGUgYXNj
aWlkb2Mgc3ludGF4LCByZWZlciB0bwotaHR0cDovL3d3dy5tZXRob2RzLmNvLm56L2FzY2lpZG9j
L3VzZXJndWlkZS5odG1sW10uCitodHRwczovL2FzY2lpZG9jLXB5LmdpdGh1Yi5pby91c2VyZ3Vp
ZGUuaHRtbFtdLgogCiA9PT0gU3VwcG9ydCBzY3JpcHRzCiAKLS0gCjIuMzUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
