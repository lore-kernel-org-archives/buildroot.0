Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36172C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD11A60757;
	Sun, 11 Dec 2022 09:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD11A60757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2poDpzfDRdmw; Sun, 11 Dec 2022 09:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1636460709;
	Sun, 11 Dec 2022 09:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1636460709
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC8701BF3D9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9832C8139A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9832C8139A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOMCU7w-u3-I for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 09:57:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762DF81360
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 762DF81360
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:57:19 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A05FFCDFED
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:37:25 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C93281C0005;
 Sun, 11 Dec 2022 09:37:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1p4Ilp-004oxv-Ht; Sun, 11 Dec 2022 10:37:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 10:37:16 +0100
Message-Id: <20221211093716.1149172-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.29.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6CgotIENWRS0yMDIyLTM3MzI1OiBB
IHplcm8gbGVuZ3RoIENhbGxlZCBvciBDYWxsaW5nIFBhcnR5IE51bWJlciBjYW4gY2F1c2UgYQog
IGJ1ZmZlciB1bmRlci1ydW4gYW5kIEFzdGVyaXNrIGNyYXNoLgoKICBodHRwczovL2Rvd25sb2Fk
cy5hc3Rlcmlzay5vcmcvcHViL3NlY3VyaXR5L0FTVC0yMDIyLTAwNy5odG1sCgotIENWRS0yMDIy
LTQyNzA1OiBVc2UgYWZ0ZXIgZnJlZSBpbiByZXNfcGpzaXBfcHVic3ViLmMgbWF5IGFsbG93IGEg
cmVtb3RlCiAgYXV0aGVudGljYXRlZCBhdHRhY2tlciB0byBjcmFzaCBBc3RlcmlzayAoZGVuaWFs
IG9mIHNlcnZpY2UpIGJ5IHBlcmZvcm1pbmcKICBhY3Rpdml0eSBvbiBhIHN1YnNjcmlwdGlvbiB2
aWEgYSByZWxpYWJsZSB0cmFuc3BvcnQgYXQgdGhlIHNhbWUgdGltZQogIEFzdGVyaXNrIGlzIGFs
c28gcGVyZm9ybWluZyBhY3RpdnR5IG9uIHRoYXQgc3Vic2NyaXB0aW9uLgoKICBodHRwczovL2Rv
d25sb2Fkcy5hc3Rlcmlzay5vcmcvcHViL3NlY3VyaXR5L0FTVC0yMDIyLTAwOC5odG1sCgotIENW
RS0yMDIyLTQyNzA2OiBBTUkgVXNlcnMgd2l0aCDigJxjb25maWfigJ0gcGVybWlzc2lvbnMgbWF5
IHJlYWQgZmlsZXMgb3V0c2lkZQogIG9mIEFzdGVyaXNrIGRpcmVjdG9yeSB2aWEgR2V0Q29uZmln
IEFNSSBBY3Rpb24gZXZlbiBpZiDigJxsaXZlX2Rhbmdlcm91c2x5IgogIGlzIHNldCB0byAibm8i
CgogIGh0dHBzOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9yZy9wdWIvc2VjdXJpdHkvQVNULTIwMjIt
MDA5Lmh0bWwKClNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJk
LmNvbT4KLS0tCiBwYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLmhhc2ggfCAyICstCiBwYWNrYWdl
L2FzdGVyaXNrL2FzdGVyaXNrLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2FzdGVyaXNrL2Fz
dGVyaXNrLmhhc2ggYi9wYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLmhhc2gKaW5kZXggOTc5MmQ4
MmFjNS4uOThlZTNiZGM3MSAxMDA2NDQKLS0tIGEvcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5o
YXNoCisrKyBiL3BhY2thZ2UvYXN0ZXJpc2svYXN0ZXJpc2suaGFzaApAQCAtMSw1ICsxLDUgQEAK
ICMgTG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICA2ZTljMmYzNTBkYjAxOGRmODU0YjEzMDE2ODdj
ZWQ4OTkzZmFjYjI3ODc2OTgzMzZlNTVjZDE5ZTBhZTNlYmZlICBhc3Rlcmlzay0xNi4yOC4wLnRh
ci5negorc2hhMjU2ICA5YjkzMDA2YTg3YmU5YzI5NDkyMjk5MTE4MjAwZTRmNjZjODM2OTg1MWM2
NmE1MGZkZWY1YjE1ZGZjNGViMmMyICBhc3Rlcmlzay0xNi4yOS4xLnRhci5negogCiAjIHNoYTEg
ZnJvbTogaHR0cDovL2Rvd25sb2Fkcy5hc3Rlcmlzay5vcmcvcHViL3RlbGVwaG9ueS9zb3VuZHMv
cmVsZWFzZXMKICMgc2hhMjU2IGxvY2FsbHkgY29tcHV0ZWQKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
YXN0ZXJpc2svYXN0ZXJpc2subWsgYi9wYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLm1rCmluZGV4
IGUwZjI4YWU3ZWUuLjIyYWMwMzM0ZmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYXN0ZXJpc2svYXN0
ZXJpc2subWsKKysrIGIvcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUFTVEVSSVNLX1ZFUlNJT04gPSAxNi4y
OC4wCitBU1RFUklTS19WRVJTSU9OID0gMTYuMjkuMQogIyBVc2UgdGhlIGdpdGh1YiBtaXJyb3I6
IGl0J3MgYW4gb2ZmaWNpYWwgbWlycm9yIG1haW50YWluZWQgYnkgRGlnaXVtLCBhbmQKICMgcHJv
dmlkZXMgdGFyYmFsbHMsIHdoaWNoIHRoZSBtYWluIEFzdGVyaXNrIGdpdCB0cmVlIChiZWhpbmQg
R2Vycml0KSBkb2VzIG5vdC4KIEFTVEVSSVNLX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGFzdGVyaXNr
LGFzdGVyaXNrLCQoQVNURVJJU0tfVkVSU0lPTikpCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
