Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA510775F9
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6082C40662;
	Wed, 18 Mar 2026 18:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSrOpRrZfNI9; Wed, 18 Mar 2026 18:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B4E640677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773858112;
	bh=jwtfPmfIcuSUfxQEhUwCg9ILXvL0tlH9Bh7mD+wjRYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a+TDcuC3w19rLU9Yi/NVh+SlMKqk4FonkNkI0TNRqcg7hsY4Q3pBK33BGEg7SituV
	 qto/eeJ0QK8xutMpLbHIhxYGlrXFhfu+FlHeu3QggMEue1H0rxXdv4XM6B8SdZy+uL
	 4W53O4JJNnel+VDE70ts/V3hC70fayN5BSFZ4w59ZyicnUFjYEen3cv1qk5sfJK5ov
	 QQA///0+R2hfKwa3UaXKTvoSDyg+UyAZZXIVe8yZmrY2ATVrwIDpZzNdw7VOmSE3qv
	 WtZu4m2BNfDXAS089N5nZhOrx1akylCbi5Z2HJDkk7vjh9Xhn/JPAFnaC1Y2Dh9FeH
	 K2a5gf/WxH7cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4E640677;
	Wed, 18 Mar 2026 18:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24CD21BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AD2740369
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCkZHrh26nhy for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 513D7400C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 513D7400C5
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:21:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5324984A17; Wed, 18 Mar 2026 18:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 19:03:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b538bf02183aae9f6cb1390f0bd73d7218fd7932
X-Git-Newrev: de7bd5034b38b69c631b1d1a3299942513051267
X-Patchwork-Hint: ignore
Message-Id: <20260318182146.5324984A17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Manuel Diener to several
 packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de7bd5034b38b69c631b1d1a3299942513051267
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add myself to packages recently orphaned which I am going to continue.

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b722b5fd51..8c9b89c249 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2210,6 +2210,29 @@ F:	package/ffmpeg/
 F:	package/mpv/
 F:	package/rpi-firmware/
 
+N:	Manuel Diener <manuel.diener@oss.othermo.de>
+F:	package/pico-sdk/
+F:	package/picotool/
+F:	package/python-annotated-doc/
+F:	package/python-apscheduler/
+F:	package/python-crc/
+F:	package/python-diskcache/
+F:	package/python-django/
+F:	package/python-gpiod/
+F:	package/python-immutabledict/
+F:	package/python-jc/
+F:	package/python-log-rate-limit/
+F:	package/python-pydantic/
+F:	package/python-pydantic-core/
+F:	package/python-pydantic-settings/
+F:	package/python-typing-inspection/
+F:	package/python-tzlocal/
+F:	package/python-sdbus-modemmanager/
+F:	package/python-sdbus-systemd/
+F:	package/python-varlink/
+F:	package/python-waitress/
+F:	package/python-whitenoise/
+
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
 F:	package/cc-tool/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
