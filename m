Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AB3CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925C085157;
	Sat, 30 May 2026 08:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDM5MWKQ_kQd; Sat, 30 May 2026 08:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508AD8515B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780128165;
	bh=g9rKooA2YYsnDzc3IWh94C+Rjn7TShqlKJ2v1MJzZMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YGn+MzVO/cDtCOzZGAPt9cq+pyLRLe+u+WuFsvfrGWx86/UinDbQSkTv16t4AWd30
	 V3NVTIjfEiLKZ7KvAUyqgbrQWf3WgUPIU8dAbuGUVj4clP+gUdNF34WSg2yUa+MlZx
	 hV38MTlJYEb/UFX7OcOVWemKSz2TBIhRN1i7G4dR1/AllIm/EUQkdPeWIAdzP/Mf5H
	 dnUI/Mr5btiDPSHD8st0YTnW3ZI2iNjR8V7l4dP1bpHR8sZ5FY87beq1JwEw2v3Mzp
	 8Z1gkuf5R5vW6bVuTOjb70qaSuu+8TSGjUjPTP1g3qj8MsTUHNv2mxh5t/JjUdcEO5
	 ckMEjpLJ2Lm8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 508AD8515B;
	Sat, 30 May 2026 08:02:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96889F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E96442C62
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDHpYKtJgCMp for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8266C42B5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8266C42B5A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:02:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D14D837D0; Sat, 30 May 2026 08:02:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:01:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64cb69f1559bc56761c17045fef9b55838a2cbca
X-Git-Newrev: fdd94cac1b737df4303cfffe24247e5b905979c0
X-Patchwork-Hint: ignore
Message-Id: <20260530080228.8D14D837D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Mauro Condarelli,
 email bounces
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fdd94cac1b737df4303cfffe24247e5b905979c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a00627b28c..657b06d7df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2366,26 +2366,6 @@ F:	package/gtkiostream/
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
-N:	Mauro Condarelli <mc5686@mclink.it>
-F:	package/mc/
-F:	package/python-autobahn/
-F:	package/python-cbor/
-F:	package/python-characteristic/
-F:	package/python-click/
-F:	package/python-lmdb/
-F:	package/python-mistune/
-F:	package/python-netaddr/
-F:	package/python-pygments/
-F:	package/python-pynacl/
-F:	package/python-pytrie/
-F:	package/python-service-identity/
-F:	package/python-setproctitle/
-F:	package/python-shutilwhich/
-F:	package/python-treq/
-F:	package/python-txaio/
-F:	package/python-ujson/
-F:	package/python-wsaccel/
-
 N:	Maksim Kiselev <bigunclemax@gmail.com>
 F:	package/ledmon/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
