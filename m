Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 06:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD60960E37;
	Mon, 27 Dec 2021 06:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHsUuUxjKfJ0; Mon, 27 Dec 2021 06:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1D1860E31;
	Mon, 27 Dec 2021 06:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15D401BF57B
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 06:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 123F460E31
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 06:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68ZGKY7VdkHt for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 06:22:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D18560E2D
 for <buildroot@uclibc.org>; Mon, 27 Dec 2021 06:22:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id B63DA82AE2; Mon, 27 Dec 2021 06:17:13 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 27 Dec 2021 06:22:57 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mlicul@yahoo.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14476-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14476] New: Cannot build Image
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDQ3NgoKICAgICAgICAg
ICAgQnVnIElEOiAxNDQ3NgogICAgICAgICAgIFN1bW1hcnk6IENhbm5vdCBidWlsZCBJbWFnZQog
ICAgICAgICAgIFByb2R1Y3Q6IGJ1aWxkcm9vdAogICAgICAgICAgIFZlcnNpb246IHVuc3BlY2lm
aWVkCiAgICAgICAgICBIYXJkd2FyZTogUEMKICAgICAgICAgICAgICAgIE9TOiBMaW51eAogICAg
ICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAg
UHJpb3JpdHk6IFA1CiAgICAgICAgIENvbXBvbmVudDogT3RoZXIKICAgICAgICAgIEFzc2lnbmVl
OiB1bmFzc2lnbmVkQGJ1aWxkcm9vdC51Y2xpYmMub3JnCiAgICAgICAgICBSZXBvcnRlcjogbWxp
Y3VsQHlhaG9vLml0CiAgICAgICAgICAgICAgICBDQzogYnVpbGRyb290QHVjbGliYy5vcmcKICBU
YXJnZXQgTWlsZXN0b25lOiAtLS0KCkhlbGxvLAoKcGxlYXNlLCBpZiBzb21lb25lIGNhbiBoZWxw
IG1lIHRvIHJlc29sdmUgdGhlIGVycm9yIHRoYXQgSSBhbSBnZXR0aW5nIHdoZW4gdHJ5CnRvIGRv
IG1ha2UgKGZvciBpbXg2IHNhYnJlLi4uKSB3aXRoIEJ1aWxkcm9vdC4gVGhhbmsgeW91IHZlcnkg
bXVjaC4gUmVnYXJkcy4KClRoZSBtYWtlIHByb2Nlc3Mgc3RvcHMgYW5kIEkgZ2V0IHRoaXMgZXJy
b3JzOgoKUEFUSD0iL2hvbWUvbS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluOi9ob21lL20vYnVp
bGRyb290L291dHB1dC9ob3N0L3NiaW46L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91
c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi9zbmFwL2JpbiIKUEtHX0NPTkZJRz0iL2hvbWUv
bS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL3BrZy1jb25maWciClBLR19DT05GSUdfU1lTUk9P
VF9ESVI9Ii8iIFBLR19DT05GSUdfQUxMT1dfU1lTVEVNX0NGTEFHUz0xClBLR19DT05GSUdfQUxM
T1dfU1lTVEVNX0xJQlM9MQpQS0dfQ09ORklHX0xJQkRJUj0iL2hvbWUvbS9idWlsZHJvb3Qvb3V0
cHV0L2hvc3QvbGliL3BrZ2NvbmZpZzovaG9tZS9tL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9zaGFy
ZS9wa2djb25maWciCiAvdXNyL2Jpbi9tYWtlIC1qOSAgLUMgL2hvbWUvbS9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL2hvc3QtdXRpbC1saW51eC0yLjM3LjIvCm1ha2VbMV06IEVudGVyaW5nIGRpcmVj
dG9yeQonL2hvbWUvbS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtdXRpbC1saW51eC0yLjM3
LjInCi91c3IvYmluL21ha2UgIGFsbC1yZWN1cnNpdmUKbWFrZVsyXTogRW50ZXJpbmcgZGlyZWN0
b3J5CicvaG9tZS9tL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC11dGlsLWxpbnV4LTIuMzcu
MicKTWFraW5nIGFsbCBpbiBwbwptYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkKJy9ob21lL20v
YnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXV0aWwtbGludXgtMi4zNy4yL3BvJwptYWtlWzNd
OiBOb3RoaW5nIHRvIGJlIGRvbmUgZm9yICdhbGwnLgptYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9y
eQonL2hvbWUvbS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtdXRpbC1saW51eC0yLjM3LjIv
cG8nCm1ha2VbM106IEVudGVyaW5nIGRpcmVjdG9yeQonL2hvbWUvbS9idWlsZHJvb3Qvb3V0cHV0
L2J1aWxkL2hvc3QtdXRpbC1saW51eC0yLjM3LjInCiAgQ0MgICAgICAgc3lzLXV0aWxzL3Vtb3Vu
dC11bW91bnQubwogIENDICAgICAgIHN5cy11dGlscy9tb3VudHBvaW50LW1vdW50cG9pbnQubwpn
Y2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZCBsaW5lIG9wdGlvbiDigJgtV2FkZHJlc3Mt
b2YtcGFja2VkLW1lbWJlcuKAmQpnY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgY29tbWFuZCBsaW5l
IG9wdGlvbiDigJgtV2FkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcuKAmQptYWtlWzNdOiAqKiogW01h
a2VmaWxlOjEzODc5OiBzeXMtdXRpbHMvdW1vdW50LXVtb3VudC5vXSBFcnJvciAxCm1ha2VbM106
ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1ha2VbM106ICoqKiBbTWFrZWZp
bGU6MTIwODc6IHN5cy11dGlscy9tb3VudHBvaW50LW1vdW50cG9pbnQub10gRXJyb3IgMQogIEND
ICAgICAgIHN5cy11dGlscy9mc3RyaW0tZnN0cmltLm8KICBDQyAgICAgICBzeXMtdXRpbHMvY3Ry
bGFsdGRlbC5vCmdjYzogZXJyb3I6IHVucmVjb2duaXplZCBjb21tYW5kIGxpbmUgb3B0aW9uIOKA
mC1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVy4oCZCmdjYzogZXJyb3I6IHVucmVjb2duaXplZCBj
b21tYW5kIGxpbmUgb3B0aW9uIOKAmC1XYWRkcmVzcy1vZi1wYWNrZWQtbWVtYmVy4oCZCm1ha2Vb
M106ICoqKiBbTWFrZWZpbGU6MTE0OTk6IHN5cy11dGlscy9mc3RyaW0tZnN0cmltLm9dIEVycm9y
IDEKbWFrZVszXTogKioqIFtNYWtlZmlsZTo5NDg4OiBzeXMtdXRpbHMvY3RybGFsdGRlbC5vXSBF
cnJvciAxCm1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5CicvaG9tZS9tL2J1aWxkcm9vdC9vdXRw
dXQvYnVpbGQvaG9zdC11dGlsLWxpbnV4LTIuMzcuMicKbWFrZVsyXTogKioqIFtNYWtlZmlsZTox
NDYxMTogYWxsLXJlY3Vyc2l2ZV0gRXJyb3IgMQptYWtlWzJdOiBMZWF2aW5nIGRpcmVjdG9yeQon
L2hvbWUvbS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtdXRpbC1saW51eC0yLjM3LjInCm1h
a2VbMV06ICoqKiBbTWFrZWZpbGU6NjMyMTogYWxsXSBFcnJvciAyCm1ha2VbMV06IExlYXZpbmcg
ZGlyZWN0b3J5CicvaG9tZS9tL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC11dGlsLWxpbnV4
LTIuMzcuMicKbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI5NToKL2hvbWUvbS9i
dWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtdXRpbC1saW51eC0yLjM3LjIvLnN0YW1wX2J1aWx0
XSBFcnJvciAyCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBh
cmUgb24gdGhlIENDIGxpc3QgZm9yIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
