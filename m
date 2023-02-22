Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEBCC6379F
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 09:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A901A40B55;
	Wed, 22 Feb 2023 09:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A901A40B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxQ7b-JCar62; Wed, 22 Feb 2023 09:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5C33404DA;
	Wed, 22 Feb 2023 09:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5C33404DA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CA571BF3F9
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26914417EF
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26914417EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jG4w2pcWrV1Z for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 09:38:42 +0000 (UTC)
X-Greylist: delayed 00:06:31 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC9C410BE
Received: from mfwd17.mailplug.co.kr (mfwd17.mailplug.co.kr [211.253.10.228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAC9C410BE
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 09:38:41 +0000 (UTC)
Received: (qmail 24552 invoked from network); 22 Feb 2023 18:31:58 +0900
Received: from wmail10.mailplug.com (121.156.118.13)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP;
 22 Feb 2023 18:30:58 +0900
Received: (qmail 624110 invoked by uid 0); 22 Feb 2023 18:30:57 +0900
MIME-Version: 1.0
From: Andrei Cherniaev <cherniaev.andrei@kairo.space>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: Mailplug (mailplug.com) mailer version 0.1
X-Priority: 3
Message-Id: <167705825735.1345689.5559147157105378409@wmail10.mailplug.com>
Date: Wed, 22 Feb 2023 18:30:55 +0900
X-MSP-FID: 1416889.1677058255.3641
Subject: [Buildroot] [RE]Re: [PATCH] boot/grub2: add information where
 isconfiguration file
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7927119347280134861=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7927119347280134861==
Content-Type: multipart/alternative;
 boundary="FADC26E290F79CE38C260CDC5BA594B530"

--FADC26E290F79CE38C260CDC5BA594B530
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gVGhvbWFzIFBldGF6em9uaSJib290L2dydWIyL2dydWIuY2ZnOiBpdCBpcyBwYXJ0IG9m
IEJ1aWxkcm9vdCBpdHNlbGYsIGFuZCB5b3UgcHJvYmFibHkgZG9uJ3Qgd2FudCB0byBoYXZlIHBy
b2plY3Qtc3BlY2lmaWMgY2hhbmdlcyBpbiB0aGVyZS4iWW91IHNheSB0aGF0IEkgdHJ5IHRvIHNl
dCBwcm9qZWN0LXNwZWNpZmljIHNldHRpbmdzLiBMb29rIGF0IEJ1aWxkcm9vdCwgaXQgc2V0IHBy
b2plY3Qtc3BlY2lmaWMgc2V0IGRlZmF1bHQ9IjAic2V0IHRpbWVvdXQ9IjUiV2h5PyBXaHkgNSwg
bm90IDY/IEJ1aWxkcm9vdCBzaG91bGRuJ3Qgc2V0IHByb2plY3Qtc3BlY2lmaWMgc2V0dGluZ3Ms
IGlzbid0IGl0PyBNYXkgYmUgbWFpbnRhaW5lciBzaG91bGQganVzdCByZW1vdmVzZXQgZGVmYXVs
dD0iMCJzZXQgdGltZW91dD0iNSJmcm9tIGdydWIuY2ZnID9BbmRyZWkgQ2hlcm5pYWV2LS0tLS0g
T3JpZ2luYWwgTWVzc2FnZSAtLS0tLUZyb20gOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0
YXp6b25pQGJvb3RsaW4uY29tPlRvIDogIkFuZHJlaUNoZXJuaWFldiIgPGNoZXJuaWFldi5hbmRy
ZWlAa2Fpcm8uc3BhY2U+Q2MgOiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+U2VudCA6IDIwMjMt
MDItMjIgMDc6MDI6MDJTdWJqZWN0IDogUmU6IFtCdWlsZHJvb3RdIFtQQVRDSF0gYm9vdC9ncnVi
MjogYWRkIGluZm9ybWF0aW9uIHdoZXJlIGlzY29uZmlndXJhdGlvbiBmaWxlSGVsbG8gQW5kcmVp
LE9uIE1vbiwgIDkgSmFuIDIwMjMgMTY6MzM6NTIgKzA5MDBBbmRyZWlDaGVybmlhZXYgPGNoZXJu
aWFldi5hbmRyZWlAa2Fpcm8uc3BhY2U+IHdyb3RlOj4gZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIv
Q29uZmlnLmluIGIvYm9vdC9ncnViMi9Db25maWcuaW4+IGluZGV4IDkyYjVkZDUwMWIuLmJmMDQw
MGMwOGYgMTAwNjQ0PiAtLS0gYS9ib290L2dydWIyL0NvbmZpZy5pbj4gKysrIGIvYm9vdC9ncnVi
Mi9Db25maWcuaW4+IEBAIC0xMjUsNiArMTI1LDcgQEAgY29uZmlnIEJSMl9UQVJHRVRfR1JVQjJf
QlVJTFRJTl9DT05GSUdfUEM+ICAJICBpbnRvIHRoZSBHcnViIGltYWdlIGl0c2VsZi4gVGhpcyBh
bGxvd3MgdG8gc2V0IHRoZSByb290PiAgCSAgZGV2aWNlIGFuZCBvdGhlciBjb25maWd1cmF0aW9u
IHBhcmFtZXRlcnMsIGJ1dCBob3dldmVyIG1lbnU+ICAJICBlbnRyaWVzIGNhbm5vdCBiZSBkZXNj
cmliZWQgaW4gdGhpcyBlbWJlZGRlZCBjb25maWd1cmF0aW9uLj4gKwkgIFVzZSBib290L2dydWIy
L2dydWIuY2ZnIHRvIGVkaXQgbWVudSBlbnRyaWVzLkFjdHVhbGx5IG5vLCB5b3UgcHJvYmFibHkg
ZG9uJ3Qgd2FudCB0byBjaGFuZ2UgYm9vdC9ncnViMi9ncnViLmNmZzogaXRpcyBwYXJ0IG9mIEJ1
aWxkcm9vdCBpdHNlbGYsIGFuZCB5b3UgcHJvYmFibHkgZG9uJ3Qgd2FudCB0byBoYXZlcHJvamVj
dC1zcGVjaWZpYyBjaGFuZ2VzIGluIHRoZXJlLkluc3RlYWQsIHlvdSBzaG91bGQgb3ZlcnJpZGUg
aXQgdXNpbmcgYSByb290ZnMgb3ZlcmxheSAoaWYgZ3J1Yi5jZmcgaXNpbiAkKFRBUkdFVF9ESVIp
L2Jvb3QpIG9yIGEgcG9zdC1idWlsZC9wb3N0LWltYWdlIHNjcmlwdCAoaWYgaXQncyBpbnRoZSBF
RkkgcGFydGl0aW9uKS5JIGhhdmUgbmV2ZXJ0aGVsZXNzIGFwcGxpZWQgeW91ciBwYXRjaCwgYnV0
IGFmdGVyIHR3ZWFraW5nIHRoZSBtZXNzYWdlaW4gdGhlIGhlbHAgdGV4dCwgYW5kIG1vdmluZyBp
dCB0byB0aGUgbWFpbiBHcnViMiBvcHRpb24uIFNlZTogIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWls
ZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC83NjkyZDViZWIyZDllNGQwYjQ2M2YwZjI2YTE3
NzgyOWU1YmNjMWVjQmVzdCByZWdhcmRzLFRob21hcyBQZXRhenpvbmktLSBUaG9tYXMgUGV0YXp6
b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmdodHRwczovL2Jvb3RsaW4uY29t

--FADC26E290F79CE38C260CDC5BA594B530
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHN0eWxlPnB7bWFyZ2luLXRvcDowcHg7bWFyZ2luLWJvdHRvbTowcHg7fTwv
c3R5bGU+PC9oZWFkPjxib2R5PjxkaXYgbmFtZT0nbXAtZGVmYXVsdCcgc3R5bGU9J2ZvbnQtZmFt
aWx5OuuPi+ybgCxEb3R1bTtmb250LXNpemU6MTBwdDsnPjxwPkhlbGxvIFRob21hcyBQZXRhenpv
bmk8L3A+PHA+PGJyPjwvcD48cD4iYm9vdC9ncnViMi9ncnViLmNmZzogaXQgaXMgcGFydCBvZiBC
dWlsZHJvb3QgaXRzZWxmLCBhbmQgeW91IHByb2JhYmx5IGRvbid0IHdhbnQgdG8gaGF2ZSBwcm9q
ZWN0LXNwZWNpZmljIGNoYW5nZXMgaW4gdGhlcmUuIjwvcD48cD5Zb3Ugc2F5IHRoYXQgSSB0cnkg
dG8gc2V0IHByb2plY3Qtc3BlY2lmaWMgc2V0dGluZ3MuIExvb2sgYXQgQnVpbGRyb290LCBpdCBz
ZXQgcHJvamVjdC1zcGVjaWZpYyA8L3A+PHA+c2V0IGRlZmF1bHQ9IjAiPGJyPnNldCB0aW1lb3V0
PSI1IjwvcD48cD5XaHk/IFdoeSA1LCBub3QgNj8gQnVpbGRyb290IHNob3VsZG4ndCBzZXQgcHJv
amVjdC1zcGVjaWZpYyBzZXR0aW5ncywgaXNuJ3QgaXQ/IE1heSBiZSBtYWludGFpbmVyIHNob3Vs
ZCBqdXN0IHJlbW92ZTwvcD48cD5zZXQgZGVmYXVsdD0iMCI8YnI+c2V0IHRpbWVvdXQ9IjUiPC9w
PjxwPmZyb20gZ3J1Yi5jZmcgPzwvcD48cD48YnI+PC9wPjxwPkFuZHJlaSBDaGVybmlhZXY8YnI+
PC9wPjxicj48L2Rpdj48Zm9udCBzdHlsZT0iZm9udC1mYW1pbHk664+L7JuALERvdHVtO2ZvbnQt
c2l6ZToxMHB0OyI+LS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLTxicj5Gcm9tIDogVGhvbWFz
IFBldGF6em9uaSAmbHQ7dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbSZndDs8YnI+VG8gOiAi
QW5kcmVpQ2hlcm5pYWV2IiAmbHQ7Y2hlcm5pYWV2LmFuZHJlaUBrYWlyby5zcGFjZSZndDs8YnI+
Q2MgOiAmbHQ7YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcmZ3Q7PGJyPlNlbnQgOiAyMDIzLTAyLTIy
IDA3OjAyOjAyPGJyPlN1YmplY3QgOiBSZTogW0J1aWxkcm9vdF0gW1BBVENIXSBib290L2dydWIy
OiBhZGQgaW5mb3JtYXRpb24gd2hlcmUgaXNjb25maWd1cmF0aW9uIGZpbGU8YnI+PGJyPjxicj48
L2ZvbnQ+SGVsbG8gQW5kcmVpLDxicj48YnI+T24gTW9uLCAgOSBKYW4gMjAyMyAxNjozMzo1MiAr
MDkwMDxicj5BbmRyZWlDaGVybmlhZXYgJmx0O2NoZXJuaWFldi5hbmRyZWlAa2Fpcm8uc3BhY2Um
Z3Q7IHdyb3RlOjxicj48YnI+Jmd0OyBkaWZmIC0tZ2l0IGEvYm9vdC9ncnViMi9Db25maWcuaW4g
Yi9ib290L2dydWIyL0NvbmZpZy5pbjxicj4mZ3Q7IGluZGV4IDkyYjVkZDUwMWIuLmJmMDQwMGMw
OGYgMTAwNjQ0PGJyPiZndDsgLS0tIGEvYm9vdC9ncnViMi9Db25maWcuaW48YnI+Jmd0OyArKysg
Yi9ib290L2dydWIyL0NvbmZpZy5pbjxicj4mZ3Q7IEBAIC0xMjUsNiArMTI1LDcgQEAgY29uZmln
IEJSMl9UQVJHRVRfR1JVQjJfQlVJTFRJTl9DT05GSUdfUEM8YnI+Jmd0OyAgCSAgaW50byB0aGUg
R3J1YiBpbWFnZSBpdHNlbGYuIFRoaXMgYWxsb3dzIHRvIHNldCB0aGUgcm9vdDxicj4mZ3Q7ICAJ
ICBkZXZpY2UgYW5kIG90aGVyIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycywgYnV0IGhvd2V2ZXIg
bWVudTxicj4mZ3Q7ICAJICBlbnRyaWVzIGNhbm5vdCBiZSBkZXNjcmliZWQgaW4gdGhpcyBlbWJl
ZGRlZCBjb25maWd1cmF0aW9uLjxicj4mZ3Q7ICsJICBVc2UgYm9vdC9ncnViMi9ncnViLmNmZyB0
byBlZGl0IG1lbnUgZW50cmllcy48YnI+PGJyPkFjdHVhbGx5IG5vLCB5b3UgcHJvYmFibHkgZG9u
J3Qgd2FudCB0byBjaGFuZ2UgYm9vdC9ncnViMi9ncnViLmNmZzogaXQ8YnI+aXMgcGFydCBvZiBC
dWlsZHJvb3QgaXRzZWxmLCBhbmQgeW91IHByb2JhYmx5IGRvbid0IHdhbnQgdG8gaGF2ZTxicj5w
cm9qZWN0LXNwZWNpZmljIGNoYW5nZXMgaW4gdGhlcmUuPGJyPjxicj5JbnN0ZWFkLCB5b3Ugc2hv
dWxkIG92ZXJyaWRlIGl0IHVzaW5nIGEgcm9vdGZzIG92ZXJsYXkgKGlmIGdydWIuY2ZnIGlzPGJy
PmluICQoVEFSR0VUX0RJUikvYm9vdCkgb3IgYSBwb3N0LWJ1aWxkL3Bvc3QtaW1hZ2Ugc2NyaXB0
IChpZiBpdCdzIGluPGJyPnRoZSBFRkkgcGFydGl0aW9uKS48YnI+PGJyPkkgaGF2ZSBuZXZlcnRo
ZWxlc3MgYXBwbGllZCB5b3VyIHBhdGNoLCBidXQgYWZ0ZXIgdHdlYWtpbmcgdGhlIG1lc3NhZ2U8
YnI+aW4gdGhlIGhlbHAgdGV4dCwgYW5kIG1vdmluZyBpdCB0byB0aGUgbWFpbiBHcnViMiBvcHRp
b24uIFNlZTo8YnI+PGJyPiAgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vY29tbWl0Lzc2OTJkNWJlYjJkOWU0ZDBiNDYzZjBmMjZhMTc3ODI5ZTViY2MxZWM8YnI+
PGJyPkJlc3QgcmVnYXJkcyw8YnI+PGJyPlRob21hcyBQZXRhenpvbmk8YnI+LS0gPGJyPlRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW48YnI+RW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmc8YnI+aHR0cHM6Ly9ib290bGluLmNv
bTxicj48L2JvZHk+PC9odG1sPjxpbWcgc3JjPSJodHRwOi8vbTEzLm1haWxwbHVnLmNvbS9hcGkv
bm90aWZ5LnBocD9ob21lPU1qQXlNekF5TWpJeE9ETXdOVFY4WW5WcGJHUnliMjkwUUdKMWFXeGtj
bTl2ZEM1dmNtZDhZMmhsY201cFlXVjJMbUZ1WkhKbGFVQnJZV2x5Ynk1emNHRmpaUT09Ij4=

--FADC26E290F79CE38C260CDC5BA594B530--


--===============7927119347280134861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7927119347280134861==--

