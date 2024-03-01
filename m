Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ADEC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 07:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7C1B41BB0;
	Fri,  1 Mar 2024 07:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_mm7VIzYf2t; Fri,  1 Mar 2024 07:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5085B41BF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5085B41BF0;
	Fri,  1 Mar 2024 07:41:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8FC71BF98E
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 07:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A571D40165
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 07:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwAkf6JB-PAk for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 07:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92066400B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92066400B5
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 07:41:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BE2687E3C; Fri,  1 Mar 2024 07:41:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 07:48:55 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cb7360f760a0f7d5ecfb85fe51c54c0233822c16
X-Git-Newrev: 967c3462579238223d901e247ec53761f2949f90
X-Patchwork-Hint: ignore
Message-Id: <20240301074149.7BE2687E3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/python-opcua-asyncio: add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=967c3462579238223d901e247ec53761f2949f90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:freeopcua:opcua-asyncio is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/39E826E8-04D1-465F-AA4E-7A41B387D7CE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fa44cc4aaa7f47f6fb0e725d33c776d526a82da0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 52c5d5117e..5a166f2f06 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -10,5 +10,7 @@ PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/9f/88/c32bd5
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
+PYTHON_OPCUA_ASYNCIO_CPE_ID_VENDOR = freeopcua
+PYTHON_OPCUA_ASYNCIO_CPE_ID_PRODUCT = opcua-asyncio
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
