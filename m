Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC197C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:17:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5640D6103B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 21:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5640D6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 231A34016B;
	Sat, 18 Sep 2021 21:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNmXZrYh7ViS; Sat, 18 Sep 2021 21:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E7C540135;
	Sat, 18 Sep 2021 21:17:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 382A71BF298
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B1B1605E1
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 21:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfGMG01c3KqP for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 21:17:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2F77605DF
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 21:17:25 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 67BF1100003;
 Sat, 18 Sep 2021 21:17:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mRhi5-0004pQ-Pb; Sat, 18 Sep 2021 23:17:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Knight <james.d.knight@live.com>
References: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
Date: Sat, 18 Sep 2021 23:17:21 +0200
In-Reply-To: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
 (James Knight's message of "Sat, 4 Sep 2021 21:35:19 -0400")
Message-ID: <87ilyxshwe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/getdeveloperlib.py: explicitly
 set devs document encoding
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Pj4+Pj4gIkphbWVzIiA9PSBKYW1lcyBLbmlnaHQgPGphbWVzLmQua25pZ2h0QGxpdmUuY29tPiB3
cml0ZXM6CgogPiBFeHBsaWNpdGx5IGluZGljYXRlIHRoZSBmaWxlIGVuY29kaW5nIHRvIFVURi04
IGZvciB0aGUgREVWRUxPUEVSUwogPiBkb2N1bWVudC4gVGhpcyBwcmV2ZW50cyBVbmljb2RlIGRl
Y29kaW5nIGVycm9ycyB3aGVuIHByaW50aW5nIEUtTWFpbAogPiBlbnRyaWVzIHdpdGggVW5pY29k
ZSBjaGFyYWN0ZXJzIG9uIHN5c3RlbXMgdXNpbmcgYW4gYWx0ZXJuYXRpdmUgZGVmYXVsdAogPiBl
bmNvZGluZyAoZS5nLiAnQ1AxMjUyJykuCgogPiBUaGlzIGNvcnJlY3RzIHRoZSBmb2xsb3dpbmcg
b2JzZXJ2ZWQgZXJyb3I6CgogPiAgICAgJCAuL3V0aWxzL2dldC1kZXZlbG9wZXJzIG91dGdvaW5n
LyoKID4gICAgIFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKID4gICAgICAgRmls
ZSAidXRpbHNcZ2V0LWRldmVsb3BlcnMiLCBsaW5lIDEwNSwgaW4gPG1vZHVsZT4KID4gICAgICAg
ICBfX21haW5fXygpCiA+ICAgICAgIEZpbGUgInV0aWxzXGdldC1kZXZlbG9wZXJzIiwgbGluZSA0
NywgaW4gX19tYWluX18KID4gICAgICAgICBkZXZzID0gZ2V0ZGV2ZWxvcGVybGliLnBhcnNlX2Rl
dmVsb3BlcnMoKQogPiAgICAgICBGaWxlICIuLi5cYnVpbGRyb290XHV0aWxzXGdldGRldmVsb3Bl
cmxpYi5weSIsIGxpbmUgMjM5LCBpbiBwYXJzZV9kZXZlbG9wZXJzCiA+ICAgICAgICAgZm9yIGxp
bmUgaW4gZjoKID4gICAgICAgRmlsZSAiLi4uXFB5dGhvbjx2ZXI+XGxpYlxlbmNvZGluZ3NcY3Ax
MjUyLnB5IiwgbGluZSAyMywgaW4gZGVjb2RlCiA+ICAgICAgICAgcmV0dXJuIGNvZGVjcy5jaGFy
bWFwX2RlY29kZShpbnB1dCxzZWxmLmVycm9ycyxkZWNvZGluZ190YWJsZSlbMF0KID4gICAgIFVu
aWNvZGVEZWNvZGVFcnJvcjogJ2NoYXJtYXAnIGNvZGVjIGNhbid0IGRlY29kZSBieXRlIDB4ODEg
aW4gcG9zaXRpb24gNjY1OTogY2hhcmFjdGVyIG1hcHMgdG8gPHVuZGVmaW5lZD4KCiA+IFNpZ25l
ZC1vZmYtYnk6IEphbWVzIEtuaWdodCA8amFtZXMuZC5rbmlnaHRAbGl2ZS5jb20+CgpIbW0sIHRo
aXMgZG9lc24ndCBxdWl0ZSBzZWVtIHRvIHdvcmsgd2hlbiBzdGRvdXQgaXMgbm90IGEgVVRGLTgg
Y29uc29sZQooRS5HLiB3aGVuIHVzaW5nIGFzIGdpdCBzZW5kLWVtYWlsIC0tY2MtY21kKToKCmVj
aG8gJExBTkcKZW5fREsuVVRGLTgKCi4vdXRpbHMvZ2V0LWRldmVsb3BlcnMgLXAgbGlieWFuZwpI
ZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+CkphbiBLdW5kcsOhdCA8amFuLmt1
bmRyYXRAY2VzbmV0LmN6PgoKTEFORz1DIC4vdXRpbHMvZ2V0LWRldmVsb3BlcnMgLXAgbGlieWFu
ZwpIZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+ClRyYWNlYmFjayAobW9zdCBy
ZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICIuL3V0aWxzL2dldC1kZXZlbG9wZXJzIiwgbGluZSAx
MDUsIGluIDxtb2R1bGU+CiAgICBfX21haW5fXygpCiAgRmlsZSAiLi91dGlscy9nZXQtZGV2ZWxv
cGVycyIsIGxpbmUgNjgsIGluIF9fbWFpbl9fCiAgICBwcmludChkZXYubmFtZSkKVW5pY29kZUVu
Y29kZUVycm9yOiAnYXNjaWknIGNvZGVjIGNhbid0IGVuY29kZSBjaGFyYWN0ZXIgdSdceGUxJyBp
biBwb3NpdGlvbiA5OiBvcmRpbmFsIG5vdCBpbiByYW5nZSgxMjgpCgouL3V0aWxzL2dldC1kZXZl
bG9wZXJzIC1wIGxpYnlhbmcgfCBjYXQKVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3Qp
OgogIEZpbGUgIi4vdXRpbHMvZ2V0LWRldmVsb3BlcnMiLCBsaW5lIDEwNSwgaW4gPG1vZHVsZT4K
ICAgIF9fbWFpbl9fKCkKICBGaWxlICIuL3V0aWxzL2dldC1kZXZlbG9wZXJzIiwgbGluZSA2OCwg
aW4gX19tYWluX18KICAgIEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KcHJp
bnQoZGV2Lm5hbWUpClVuaWNvZGVFbmNvZGVFcnJvcjogJ2FzY2lpJyBjb2RlYyBjYW4ndCBlbmNv
ZGUgY2hhcmFjdGVyIHUnXHhlMScgaW4gcG9zaXRpb24gOTogb3JkaW5hbCBub3QgaW4gcmFuZ2Uo
MTI4KQoKClJldmVydGluZyA5ZjEyN2NjNDIwODg0YWQgZml4ZXMgaXQ6CgouL3V0aWxzL2dldC1k
ZXZlbG9wZXJzIC1wIGxpYnlhbmcKSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29t
PgpKYW4gS3VuZHLDoXQgPGphbi5rdW5kcmF0QGNlc25ldC5jej4KCkxBTkc9QyAuL3V0aWxzL2dl
dC1kZXZlbG9wZXJzIC1wIGxpYnlhbmcKSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwu
Y29tPgpKYW4gS3VuZHLDoXQgPGphbi5rdW5kcmF0QGNlc25ldC5jej4KCi4vdXRpbHMvZ2V0LWRl
dmVsb3BlcnMgLXAgbGlieWFuZyB8IGNhdApIZWlrbyBUaGllcnkgPGhlaWtvLnRoaWVyeUBnbWFp
bC5jb20+CkphbiBLdW5kcsOhdCA8amFuLmt1bmRyYXRAY2VzbmV0LmN6PgoKCkFueSBpZGVhIGFi
b3V0IGhvdyB0byBmaXggdGhpcywgb3Igc2hvdWxkIGl0IGp1c3QgYmUgcmV2ZXJ0ZWQ/CgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
