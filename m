Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9911C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96A8740574;
	Wed, 21 Sep 2022 20:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96A8740574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxoTiyAFik1W; Wed, 21 Sep 2022 20:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B27234051B;
	Wed, 21 Sep 2022 20:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B27234051B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 638291BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F2C240217
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F2C240217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyGTwgHDtbLw for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:19:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 722FE400D2
 for <buildroot@uclibc.org>; Wed, 21 Sep 2022 20:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722FE400D2
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 620E085D46; Wed, 21 Sep 2022 20:19:38 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 21 Sep 2022 20:19:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: romain.naour@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15006-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15006] New: toolchain Arm AArch64 toolchain
 11.2-2022.02
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNTAwNgoKICAgICAgICAg
ICAgQnVnIElEOiAxNTAwNgogICAgICAgICAgIFN1bW1hcnk6IHRvb2xjaGFpbiBBcm0gQUFyY2g2
NCB0b29sY2hhaW4gMTEuMi0yMDIyLjAyCiAgICAgICAgICAgUHJvZHVjdDogYnVpbGRyb290CiAg
ICAgICAgICAgVmVyc2lvbjogdW5zcGVjaWZpZWQKICAgICAgICAgIEhhcmR3YXJlOiBBbGwKICAg
ICAgICAgICAgICAgIE9TOiBMaW51eAogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAg
U2V2ZXJpdHk6IG5vcm1hbAogICAgICAgICAgUHJpb3JpdHk6IFA1CiAgICAgICAgIENvbXBvbmVu
dDogT3RoZXIKICAgICAgICAgIEFzc2lnbmVlOiB1bmFzc2lnbmVkQGJ1aWxkcm9vdC51Y2xpYmMu
b3JnCiAgICAgICAgICBSZXBvcnRlcjogcm9tYWluLm5hb3VyQGdtYWlsLmNvbQogICAgICAgICAg
ICAgICAgQ0M6IGJ1aWxkcm9vdEB1Y2xpYmMub3JnCiAgVGFyZ2V0IE1pbGVzdG9uZTogLS0tCgpI
ZWxsbywKCkknbSB1c2luZyB0aGUgY3VycmVudCBCdWlsZHJvb3QgbWFzdGVyIGJyYW5jaCBhZnRl
ciB0aGUgMjAyMi4wOCByZWxlYXNlIGFuZAphZnRlciB0aGUgbWVyZ2Ugb2YgdGhlIG5leHQgYnJh
bmNoIHRoYXQgaW5jbHVkZSBhIEFSTSB0b29sY2hhaW4gdmVyc2lvbiBidW1wIHRvCjExLjItMjAy
Mi4wMi4KClRoaXMgdG9vbGNoYWluIHRyaWdnZXIgc29tZSAiSWxsZWdhbCBpbnN0cnVjdGlvbiIg
ZXJyb3Igb24gc29tZSB4ODZfNjQgaG9zdApsaWtlIEludGVsKFIpIFhlb24oUikgQ1BVIFg1Njcw
LgoKZ2ZvcnRyYW4gaXMgbm90IGFibGUgdG8gcGFzcyB0aGUgY2hlY2sgaW4gaGVscGVyLm1rOgoK
PGJ1aWx0LWluPjogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IElsbGVnYWwgaW5zdHJ1Y3Rpb24K
MHg3ZjQyYzgzZWZkNWYgPz8/CiAgICAgICAgLi9zaWduYWwvLi4vc3lzZGVwcy91bml4L3N5c3Yv
bGludXgveDg2XzY0L3NpZ2FjdGlvbi5jOjAKMHg3ZjQyYzgzZGFkMDkgX19saWJjX3N0YXJ0X21h
aW4KICAgICAgICAuLi9jc3UvbGliYy1zdGFydC5jOjMwOApQbGVhc2Ugc3VibWl0IGEgZnVsbCBi
dWcgcmVwb3J0LAp3aXRoIHByZXByb2Nlc3NlZCBzb3VyY2UgaWYgYXBwcm9wcmlhdGUuClBsZWFz
ZSBpbmNsdWRlIHRoZSBjb21wbGV0ZSBiYWNrdHJhY2Ugd2l0aCBhbnkgYnVnIHJlcG9ydC4KCkRp
c2FibGluZyBnZm9ydHJhbiBhbGxvd3MgdG8gY29udGludWUgdGhlIGJ1aWxkIGJ1dCBpdCBicmVh
ayB3aXRoIGJ1c3lib3ggYnVpbGQKd2l0aCBzaW1pbGFyIGVycm9yczoKCmZyZWUoKTogaW52YWxp
ZCBuZXh0IHNpemUgKGZhc3QpCmVkaXRvcnMvYXdrLmM6IEluIGZ1bmN0aW9uIOKAmHBhcnNlX2V4
cHLigJk6CmVkaXRvcnMvYXdrLmM6NjA4OjIxOiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogQWJv
cnRlZAogIDYwOCB8ICNkZWZpbmUgRyAoKihzdHJ1Y3QgZ2xvYmFsczIgKilwdHJfdG9fZ2xvYmFs
cykKICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CmVkaXRvcnMvYXdrLmM6NjQy
OjIzOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYR+KAmQogIDY0MiB8ICNkZWZpbmUg
dF9pbmZvICAgICAgIChHLnRfaW5mbyAgICAgICkKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgXgplZGl0b3JzL2F3ay5jOjE0MDY6NDE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDi
gJh0X2luZm/igJkKIDE0MDYgfCAgICAgICAgICAgICAgICAgY24gPSB2bi0+ci5uID0gbmV3X25v
ZGUodF9pbmZvKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+CgpkdXJpbmcgR0lNUExFIHBhc3M6IHN0cmxlbgpuZXR3b3JraW5nL3RjLmM6IElu
IGZ1bmN0aW9uIOKAmGNicV9wcmludF9vcHQuaXNyYeKAmToKbmV0d29ya2luZy90Yy5jOjIzNDox
MjogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6IElsbGVnYWwgaW5zdHJ1Y3Rpb24KICAyMzQgfCBz
dGF0aWMgaW50IGNicV9wcmludF9vcHQoc3RydWN0IHJ0YXR0ciAqb3B0KQogICAgICB8ICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fgoKZnJlZSgpOiBpbnZhbGlkIHBvaW50ZXIKZHVyaW5nIEdJTVBM
RSBwYXNzOiBzc2EKY29yZXV0aWxzL3NvcnQuYzogSW4gZnVuY3Rpb24g4oCYYmJfYXNjaWlfdG91
cHBlcuKAmToKY29yZXV0aWxzL3NvcnQuYzo2NDg6MTogaW50ZXJuYWwgY29tcGlsZXIgZXJyb3I6
IEFib3J0ZWQKICA2NDggfCB9CiAgICAgIHwgXgoKMHg3ZjEwN2Y2YjJkNWYgPz8/CiAgICAgICAg
Li9zaWduYWwvLi4vc3lzZGVwcy91bml4L3N5c3YvbGludXgveDg2XzY0L3NpZ2FjdGlvbi5jOjAK
MHg3ZjEwN2Y2YjJjZTEgX19HSV9yYWlzZQogICAgICAgIC4uL3N5c2RlcHMvdW5peC9zeXN2L2xp
bnV4L3JhaXNlLmM6NTEKMHg3ZjEwN2Y2OWM1MzYgX19HSV9hYm9ydAogICAgICAgIC4vc3RkbGli
L2Fib3J0LmM6NzkKMHg3ZjEwN2Y2ZjU3NjcgX19saWJjX21lc3NhZ2UKICAgICAgICAuLi9zeXNk
ZXBzL3Bvc2l4L2xpYmNfZmF0YWwuYzoxNTUKMHg3ZjEwN2Y2ZmNhNTkgbWFsbG9jX3ByaW50ZXJy
CiAgICAgICAgLi9tYWxsb2MvbWFsbG9jLmM6NTM0NwoweDdmMTA3ZjZmZGMxMyBfaW50X2ZyZWUK
ICAgICAgICAuL21hbGxvYy9tYWxsb2MuYzo0MTczCjB4N2YxMDdmNjlkZDA5IF9fbGliY19zdGFy
dF9tYWluCiAgICAgICAgLi4vY3N1L2xpYmMtc3RhcnQuYzozMDgKUGxlYXNlIHN1Ym1pdCBhIGZ1
bGwgYnVnIHJlcG9ydCwKd2l0aCBwcmVwcm9jZXNzZWQgc291cmNlIGlmIGFwcHJvcHJpYXRlLgpQ
bGVhc2UgaW5jbHVkZSB0aGUgY29tcGxldGUgYmFja3RyYWNlIHdpdGggYW55IGJ1ZyByZXBvcnQu
ClNlZSA8aHR0cHM6Ly9idWdzLmxpbmFyby5vcmcvPiBmb3IgaW5zdHJ1Y3Rpb25zLgoKSXQgaGFw
cGVuIHdpdGggdGhlIGFybSBhbmQgYWFyY2g2NCB0YXJnZXQuCgpUZXN0ZWQgd2l0aCBJbnRlbChS
KSBDb3JlKFRNKSBpNy0xMDg1MEggY3B1IGRvZXNuJ3QgdHJpZ2dlciBzdWNoIHByb2JsZW0uCgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNh
dXNlOgpZb3UgYXJlIG9uIHRoZSBDQyBsaXN0IGZvciB0aGUgYnVnLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
