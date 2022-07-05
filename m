Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E3DC43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 17:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202B160F2B;
	Tue,  5 Jul 2022 17:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 202B160F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cg4NuCfIILuy; Tue,  5 Jul 2022 17:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE2E60ED5;
	Tue,  5 Jul 2022 17:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE2E60ED5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF891BF31C
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 17:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55B95408DC
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 17:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55B95408DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHWBiAl2mG1j for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 17:11:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEEB2408D5
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEEB2408D5
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 17:11:54 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout01.t-online.de (Postfix) with SMTP id 331A86412
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 19:11:49 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.181.254]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o8m5U-0GrCtd0; Tue, 5 Jul 2022 19:11:49 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:37882)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o8m5U-0001hZ-JT
 for buildroot@buildroot.org; Tue, 05 Jul 2022 19:11:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 19:11:48 +0200
Message-Id: <20220705171148.1122924-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657041109-0143E336-B58A844F/0/0 CLEAN NORMAL
X-TOI-MSGID: c9e6eb6e-a02f-4b72-8f53-b2b75a374c7c
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: bump version to 1.2.7.1
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

Q2hhbmdlbG9nOiBodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL3dpa2kvQ2hhbmdlc192MS4y
LjdfdjEuMi43LjEKClJlbW92ZWQgcGF0Y2ggd2hpY2ggd2FzIGFwcGxpZWQgdXBzdHJlYW06Cmh0
dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS1saWIvY29tbWl0LzkyZmZmNGU5ZDA2
OTIyZmEzNjQ4ZDg1Yzg1MDE2MzhjODY5ZDYxODQKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KLS0tCiAuLi4vMDAwMi1vdXRwdXQtaW5jbHVkZS1z
dGRhcmcuaC5wYXRjaCAgICAgICAgfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2Fs
c2EtbGliL2Fsc2EtbGliLmhhc2ggICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9hbHNh
LWxpYi9hbHNhLWxpYi5tayAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL2Fsc2EtbGliLzAwMDItb3V0cHV0LWluY2x1ZGUtc3RkYXJnLmgucGF0Y2gKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2Fsc2EtbGliLzAwMDItb3V0cHV0LWluY2x1ZGUtc3RkYXJnLmgucGF0
Y2ggYi9wYWNrYWdlL2Fsc2EtbGliLzAwMDItb3V0cHV0LWluY2x1ZGUtc3RkYXJnLmgucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGNmN2MyNWJlY2QuLjAwMDAwMDAwMDAKLS0t
IGEvcGFja2FnZS9hbHNhLWxpYi8wMDAyLW91dHB1dC1pbmNsdWRlLXN0ZGFyZy5oLnBhdGNoCisr
KyAvZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAotRnJvbSBiN2MwMTY5YTYyZDRlNmFkMWEwYTlk
ZTRlZjhhZTgwODllZTk4ODcyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQmVybmQg
S3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgotRGF0ZTogU2F0LCAxMSBKdW4gMjAyMiAx
OToxMjoxOSArMDIwMAotU3ViamVjdDogW1BBVENIXSBvdXRwdXQ6IGluY2x1ZGUgc3RkYXJnLmgK
LU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotRml4ZXMgYSBidWlsZCBlcnJv
ciB3aXRoIGFsc2EtdXRpbHMgd2hlbiBidWlsZCB3aXRoIGEgdUNsaWJjIHRvb2xjaGFpbjoKLQot
YWxzYS11dGlscy9ob3N0L3g4Nl82NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QvdXNy
L2luY2x1ZGUvYWxzYS9vdXRwdXQuaDo3NTo2NjoKLSBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYdmFfbGlzdOKAmQotICAgNzUgfCBpbnQgc25kX291dHB1dF92cHJpbnRmKHNuZF9vdXRwdXRf
dCAqb3V0cHV0LCBjb25zdCBjaGFyICpmb3JtYXQsIHZhX2xpc3QgYXJncyk7Ci0gICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fgotYWxzYS11dGlscy9ob3N0L3g4Nl82NC1idWlsZHJvb3QtbGludXgtdWNs
aWJjL3N5c3Jvb3QvdXNyL2luY2x1ZGUvYWxzYS9vdXRwdXQuaDoxOjE6Ci0gbm90ZTog4oCYdmFf
bGlzdOKAmSBpcyBkZWZpbmVkIGluIGhlYWRlciDigJg8c3RkYXJnLmg+4oCZOyBkaWQgeW91IGZv
cmdldCB0byDigJgjaW5jbHVkZSA8c3RkYXJnLmg+4oCZPwotCi1QYXRjaCBzZW50IHVwc3RyZWFt
OiBodHRwczovL2dpdGh1Yi5jb20vYWxzYS1wcm9qZWN0L2Fsc2EtbGliL3B1bGwvMjM3Ci0KLVNp
Z25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KLS0tLQot
IGluY2x1ZGUvb3V0cHV0LmggfCAyICsrCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQotCi1kaWZmIC0tZ2l0IGEvaW5jbHVkZS9vdXRwdXQuaCBiL2luY2x1ZGUvb3V0cHV0LmgKLWlu
ZGV4IDRhOTcwZGM0Li41ZTE2NDIwYiAxMDA2NDQKLS0tLSBhL2luY2x1ZGUvb3V0cHV0LmgKLSsr
KyBiL2luY2x1ZGUvb3V0cHV0LmgKLUBAIC0yOCw2ICsyOCw4IEBACi0gI2lmbmRlZiBfX0FMU0Ff
T1VUUFVUX0gKLSAjZGVmaW5lIF9fQUxTQV9PVVRQVVRfSAotIAotKyNpbmNsdWRlIDxzdGRhcmcu
aD4KLSsKLSAjaWZkZWYgX19jcGx1c3BsdXMKLSBleHRlcm4gIkMiIHsKLSAjZW5kaWYKLS0tIAot
Mi4zMC4yCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWxzYS1saWIvYWxzYS1saWIuaGFzaCBiL3Bh
Y2thZ2UvYWxzYS1saWIvYWxzYS1saWIuaGFzaAppbmRleCBhODU5NTA1MzcyLi43YzE3ZTE4ZWMz
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLmhhc2gKKysrIGIvcGFja2Fn
ZS9hbHNhLWxpYi9hbHNhLWxpYi5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNhbGN1
bGF0ZWQKLXNoYTI1NiAgODgxNGU2MWY3ZWM2ODEyYzc2ZTIzYTg1Y2FiMDBlMGIwZDNiYmE0MDgx
NmFmMzZiNzI2YmViMWJjMDRjNzRhNyAgYWxzYS1saWItMS4yLjcudGFyLmJ6Mgorc2hhMjU2ICAw
NDZkYzQyZGZjZmFkMjY5MjE3YmUwNTk1NDY4NjEzN2U1ZTczOTdmMzA0MTM3MmY4YzZkY2Q3ZDc5
NDYxZTYxICBhbHNhLWxpYi0xLjIuNy4xLnRhci5iejIKIHNoYTI1NiAgMzI0MzRhZmNjODY2NmJh
MDYwZTExMWQ3MTViZmRiNmMyZDVkZDhhMzVmYTRkM2FiOGFkNjdkOGY4NTBkMmYyYiAgQ09QWUlO
Rwogc2hhMjU2ICBiZmUxNmNmODIzYmNmZjI2MWZjNmEwNjJjMDdlZTk2NjYwZTNjMzk2NzhmNDJm
MzlhNzg4YTY4ZGJjMjM0Y2VkICBhc2VydmVyL0NPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
YWxzYS1saWIvYWxzYS1saWIubWsgYi9wYWNrYWdlL2Fsc2EtbGliL2Fsc2EtbGliLm1rCmluZGV4
IGQ2MDU0YmIwMDAuLjYxZjYyNWJjZmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYWxzYS1saWIvYWxz
YS1saWIubWsKKysrIGIvcGFja2FnZS9hbHNhLWxpYi9hbHNhLWxpYi5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUFMU0FfTElCX1ZFUlNJT04gPSAxLjIu
NworQUxTQV9MSUJfVkVSU0lPTiA9IDEuMi43LjEKIEFMU0FfTElCX1NPVVJDRSA9IGFsc2EtbGli
LSQoQUxTQV9MSUJfVkVSU0lPTikudGFyLmJ6MgogQUxTQV9MSUJfU0lURSA9IGh0dHBzOi8vd3d3
LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL2xpYgogQUxTQV9MSUJfTElDRU5TRSA9IExHUEwt
Mi4xKyAobGlicmFyeSksIEdQTC0yLjArIChhc2VydmVyKQotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
