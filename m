Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB756EA71AD
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8298C61002;
	Sun, 19 Apr 2026 21:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PQaG4jctt3y; Sun, 19 Apr 2026 21:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C379461003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776634778;
	bh=TqquNMR6Qe54Um9C3VfwNgQXbMMgA+yBIJZiWya+VC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XmrCpVJYx69IlnhjbZX0PnTGZoCepqwp/qTn7bi3xLlQpqm4DqgbTO3mWy+mxXSwF
	 Ez1qgABL+LBQaN1YNm0WnGcaJJbAqnWvgwLR20qdeiQncz7GS9JolCO5eUQ6R5P8uD
	 cDhbsNQX0ZKFGQBQLYb/2UeMrxN6SjgTV0US3fJuCbyHDLPfJHteJQ44Fr0GJ7Rk2m
	 2b41q+p0ILszUlEWW6U6/3FYlEo1p8/uxm+xmWcrwZ6pSwF8UoBNhX6/a+La/N8FJQ
	 qGaCJ2XP6aqEM3AGDYOGnxvL+uTAyIsfAzo1odsMP/usuBU+4z/mLHoUoAidaXOTBo
	 4jkE25oG7S7kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C379461003;
	Sun, 19 Apr 2026 21:39:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23EDB259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BD2961002
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FImqD71TEABh for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 21:39:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A88E61001
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A88E61001
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 21:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1430820E1; Sun, 19 Apr 2026 21:39:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 23:31:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f5e9556a13cf662732aeaa829a4b0e661e3a7ab
X-Git-Newrev: bf7c35d4f799cacc382633b01f9b934ea59af21a
X-Patchwork-Hint: ignore
Message-Id: <20260419213935.F1430820E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Shubham Chakraborty as pv
 maintainer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf7c35d4f799cacc382633b01f9b934ea59af21a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b20cf7d93c..eba91f10a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3063,6 +3063,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/hyperfine/
+F:	package/pv/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
