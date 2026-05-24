Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9012FCD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 19:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68BD44118D;
	Sun, 24 May 2026 19:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXCNwN900G8M; Sun, 24 May 2026 19:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0ED240DB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779652017;
	bh=aj9f8g7zGgniYEiSCeZhy5hrzEPKM02ejRcf/Pwswa0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c76+6Z8WT7BrHoibXOpJnzH31YfIPE2N5Ob+6jYd8+/3zdGbMpkYX1YA1s5PczYpu
	 e3YCq+FKn8RALKnZ1TfFyTIcnW8hvAvuMzbISKL348QDXc+EfX0UWO26PU58knaZnh
	 vvYpJRNs1s/kl/FfPh9QmQkQoTG0GnFq8CQ/Wnsfo5L1qnYfNW90PhaJiCK1yTuxAY
	 TT452Jjl4QcbXvjsh/ii9ENHWzilq2+01XBiG+jo3q8dc2mZAO/1ljDhwyAs4lS8pi
	 RSqd0PLWznMq5P91hXAA0lhM9nMEnJR4eLhOEQKnzfITgh6vsGh2j0n/ZAHUYD+hBT
	 tOpOWDXwn+Sxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0ED240DB6;
	Sun, 24 May 2026 19:46:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CFBA265
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32583408E8
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3d2OgV41vZKE for <buildroot@buildroot.org>;
 Sun, 24 May 2026 19:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E9214087D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E9214087D
 for <buildroot@buildroot.org>; Sun, 24 May 2026 19:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B96286E3B; Sun, 24 May 2026 19:46:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 21:45:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8181bc6e06b55965d39126bacfafa6e2bfb2cf55
X-Git-Newrev: 9d4d79f9aebd7974ecab60c9c335190ef974aece
X-Patchwork-Hint: ignore
Message-Id: <20260524194645.0B96286E3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update entry for Viacheslav
 Bocharov
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d4d79f9aebd7974ecab60c9c335190ef974aece
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Update email address to v@baodeep.com.
- Take over maintainership of package/amlogic-boot-fip.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 125e7f8248..47f88a677e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3346,7 +3346,8 @@ F:	package/llvm-project/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
-N:	Viacheslav Bocharov <adeep@lexina.in>
+N:	Viacheslav Bocharov <v@baodeep.com>
+F:	package/amlogic-boot-fip/
 F:	package/rtl8822cs/
 
 N:	Victor Huesca <victor.huesca@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
