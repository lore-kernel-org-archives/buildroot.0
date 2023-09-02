Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205BAC001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 12:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D79F409F8;
	Sat,  2 Sep 2023 12:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D79F409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJMFTGWdF6gM; Sat,  2 Sep 2023 12:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3E440964;
	Sat,  2 Sep 2023 12:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3E440964
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7FE31BF41B
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 919FB40469
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 12:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 919FB40469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FiJr2IHnNcRD for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 12:48:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0AD403A2
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 12:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0AD403A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5C46868A6; Sat,  2 Sep 2023 12:48:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 14:47:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9e057e7897008a6aabcd91109cf004e5ffd957ff
X-Git-Newrev: 571bf3f7a6f937d7625f12a768685fb78d29df9c
X-Patchwork-Hint: ignore
Message-Id: <20230902124807.B5C46868A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-datafile: bump to
 version 0.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=571bf3f7a6f937d7625f12a768685fb78d29df9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index e3b415ad4d..2e993bc887 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  b511ce5a4f4072bb6c496bd42760fa92a0576d0c77828b6a2600d68fe9d7e998  datafile-0.7-1.src.rock
+sha256  13cb4816f459e71c525f256dbf197a516deb0f6b9ad98a9a0dc0aafe0d415194  datafile-0.10-1.src.rock
 sha256  0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 3b4c65d3e3..943ed9b8bc 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.7-1
+LUA_DATAFILE_VERSION = 0.10-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
