Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BFCE7D26A
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 09:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358B06147C;
	Tue, 26 Sep 2023 09:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 358B06147C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVdXdcVZbIpu; Tue, 26 Sep 2023 09:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8276140A;
	Tue, 26 Sep 2023 09:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8276140A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABC1F1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D2FF41E4B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 09:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2FF41E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qo9JVS7bJ0jP for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 09:02:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 620F141E48
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 09:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 620F141E48
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E97180DA6; Tue, 26 Sep 2023 09:02:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 09:55:31 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c9b28508e96eed7b0a0fdd79ad48755cc3d637db
X-Git-Newrev: 7da37962ced51497d9060c845b9f215fc67ec070
X-Patchwork-Hint: ignore
Message-Id: <20230926090230.4E97180DA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] docs/manual: add section
 to explain how to give credits to a sponsor
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

commit: https://git.buildroot.net/buildroot/commit/?id=7da37962ced51497d9060c845b9f215fc67ec070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Sometimes it happens that a Company or a Physical Person sponsors the
creation and/or the upstreaming process of a patch, but at the moment
there is no way to give credits to it. In Linux they prepend '+sponsor'
to the e-mail of the contributor in both authorship and commit log tag as
discussed here[0]. So let's describe in the manual how to do that as a
standard.

[0]: https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr:
  - reword to reference sub-addressing and the RFC
  - move to the "submitting patches" section, that already deals with
    SoB tags
  - differentiate between Your/Their names
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de349df08c653a822166f94dbe01295a5a3cfa6e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 94f1c64496..15fe36aef0 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -247,6 +247,23 @@ which have the upstream license), and that you are allowed to do so.
 See http://developercertificate.org/[the Developer Certificate of
 Origin] for details.
 
+To give credits to who sponsored the creation of a patch or the process of
+upstreaming it, you may use
+https://datatracker.ietf.org/doc/html/rfc5233[email subaddressing] for
+your git identity (i.e. what is used as commit author and email +From:+
+field, as well as your Signed-off-by tag); add suffix to the local part,
+separated from it by a plus `+` sign. E.g.:
+
+* for a company which sponsored the submitted work, use the company name
+  as the detail (suffix) part:
++
+`Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
+
+* for an individual who sponsored who sponsored the submitted work, use
+  their name and surname:
++
+`Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`
+
 When adding new packages, you should submit every package in a
 separate patch. This patch should have the update to
 +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
