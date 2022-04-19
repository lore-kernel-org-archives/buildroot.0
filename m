Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D7AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 13:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FF0D61160;
	Tue, 19 Apr 2022 13:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8B1Y4M-SugN; Tue, 19 Apr 2022 13:11:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 426E4612C2;
	Tue, 19 Apr 2022 13:11:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99B291BF42C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 13:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8822C8141D
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 13:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYcWE0Ze2Mtb for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 13:11:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96EE58141A
 for <buildroot@uclibc.org>; Tue, 19 Apr 2022 13:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 99EB383C2A; Tue, 19 Apr 2022 13:01:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 19 Apr 2022 13:11:39 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: joerg.hering@macgregor.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity cf_target cc cf_host
Message-ID: <bug-14766-163-dmRgm2uTLc@https.bugs.busybox.net/>
In-Reply-To: <bug-14766-163@https.bugs.busybox.net/>
References: <bug-14766-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14766] package dhcp on buildroot 2022.02.1 failed
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

aHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3Nob3dfYnVnLmNnaT9pZD0xNDc2NgoKSsO2cmcgSGVy
aW5nIDxqb2VyZy5oZXJpbmdAbWFjZ3JlZ29yLmNvbT4gY2hhbmdlZDoKCiAgICAgICAgICAgV2hh
dCAgICB8UmVtb3ZlZCAgICAgICAgICAgICAgICAgICAgIHxBZGRlZAotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAgICAgICAgICAgU2V2ZXJpdHl8bm9ybWFsICAgICAgICAgICAgICAgICAgICAgIHxibG9j
a2VyCiAgICAgICAgICAgICBUYXJnZXR8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxhYXJj
aDY0IHByb2Nlc3NvciAoTlhQCiAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHxMUzEwNDZBKQogICAgICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8am9lcmcuaGVyaW5nQG1hY2dyZWdvci5jb20KICAgICAgICAgICAgICAgSG9z
dHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgfDUuMTMuMC0zOS1nZW5lcmljCiAgICAgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwjNDR+MjAuMDQuMS1VYnVu
dHUgU01QIFRodQogICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8TWFyIDI0IDE2OjQzOjM1IFVUQyAyMDIyCiAgICAgICAgICAgICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHx4ODZfNjQgeDg2XzY0IHg4Nl82NAogICAgICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8R05VL0xpbnV4CgotLSAKWW91IGFyZSBy
ZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgb24gdGhlIENDIGxpc3QgZm9yIHRo
ZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
