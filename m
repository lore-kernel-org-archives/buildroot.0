Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1EAC4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B8E64085C;
	Mon, 26 Dec 2022 21:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B8E64085C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oS_rQLvotZkA; Mon, 26 Dec 2022 21:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E664067F;
	Mon, 26 Dec 2022 21:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42E664067F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079A21BF8C7
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6FB64067F
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6FB64067F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9WBAO008YrF for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAD424054E
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 21:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAD424054E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D722B86DD1; Mon, 26 Dec 2022 21:13:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:10:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eda08c6b88ca466c27cb02004e92ac5ae6e60998
X-Git-Newrev: 7145d04349fbc92588984a01180fc35f044f879a
X-Patchwork-Hint: ignore
Message-Id: <20221226211335.D722B86DD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-datafile: bump to version 0.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7145d04349fbc92588984a01180fc35f044f879a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 07a13e7e8a..e3b415ad4d 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  4f7d58c50267b5ebd2145e52aaa5fb63fbf63a74ae765f08e2d0dddd570b6b6a  datafile-0.6-1.src.rock
+sha256  b511ce5a4f4072bb6c496bd42760fa92a0576d0c77828b6a2600d68fe9d7e998  datafile-0.7-1.src.rock
 sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 5d30fdcf97..3b4c65d3e3 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.6-1
+LUA_DATAFILE_VERSION = 0.7-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
