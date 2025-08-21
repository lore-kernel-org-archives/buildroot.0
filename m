Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92050CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09822616BA;
	Thu, 21 Aug 2025 18:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcO94Jdh7Pxa; Thu, 21 Aug 2025 18:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 589596167A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589596167A;
	Thu, 21 Aug 2025 18:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACBB725B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E717845EF
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0-EDqFRZjRX for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF11C842DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF11C842DA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEA5187A07; Thu, 21 Aug 2025 18:56:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:36:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 90ffd2cad98db3598f4fe40cde0f86fa99a9a083
X-Git-Newrev: f35f54020599af914b5f2f138bd6e3e24cc623a2
X-Patchwork-Hint: ignore
Message-Id: <20250821185658.CEA5187A07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/luajit: ignore
 multiple CVEs
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f35f54020599af914b5f2f138bd6e3e24cc623a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This patch ignores the following CVEs that are already fixed in the
current version.

- CVE-2020-15890

For more information, see:
- https://nvd.nist.gov/vuln/detail/CVE-2020-15890
- https://github.com/LuaJIT/LuaJIT/commit/53f82e6e2e858a0a62fd1a2ff47e9866693382e6

- CVE-2020-24372

For more information, see:
- https://nvd.nist.gov/vuln/detail/CVE-2020-24372
- https://github.com/LuaJIT/LuaJIT/commit/e296f56b825c688c3530a981dc6b495d972f3d01

- CVE-2024-25176

For more information, see:
- https://nvd.nist.gov/vuln/detail/CVE-2024-25176
- https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc

- CVE-2024-25177

For more information, see:
- https://nvd.nist.gov/vuln/detail/CVE-2024-25177
- https://github.com/LuaJIT/LuaJIT/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f

- CVE-2024-25178

For more information, see:
- https://nvd.nist.gov/vuln/detail/CVE-2024-25178
- https://github.com/LuaJIT/LuaJIT/commit/defe61a56751a0db5f00ff3ab7b8f45436ba74c8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 98f0d8ad01e6834aab889ff80c59a46e341a42ed)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luajit/luajit.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index ebec4d87ac..f4836df91d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -12,6 +12,21 @@ LUAJIT_CPE_ID_VENDOR = luajit
 LUAJIT_CPE_ID_VERSION = 2.1.0
 LUAJIT_CPE_ID_UPDATE = beta3
 
+# Fixed in 53f82e6e2e858a0a62fd1a2ff47e9866693382e6
+LUAJIT_IGNORE_CVES += CVE-2020-15890
+
+# Fixed in e296f56b825c688c3530a981dc6b495d972f3d01
+LUAJIT_IGNORE_CVES += CVE-2020-24372
+
+# Fixed in 343ce0edaf3906a62022936175b2f5410024cbfc
+LUAJIT_IGNORE_CVES += CVE-2024-25176
+
+# Fixed in 85b4fed0b0353dd78c8c875c2f562d522a2b310f
+LUAJIT_IGNORE_CVES += CVE-2024-25177
+
+# Fixed in defe61a56751a0db5f00ff3ab7b8f45436ba74c8
+LUAJIT_IGNORE_CVES += CVE-2024-25178
+
 LUAJIT_INSTALL_STAGING = YES
 
 LUAJIT_PROVIDES = luainterpreter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
