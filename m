Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E25E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D90C083DDD;
	Sat, 30 Sep 2023 14:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90C083DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5ur42Bksw7I; Sat, 30 Sep 2023 14:10:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A41EA83DBD;
	Sat, 30 Sep 2023 14:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A41EA83DBD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF66E1BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 980C783DBD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980C783DBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQZD05JLHly9 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A6B83CFC
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A6B83CFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B49983A28; Sat, 30 Sep 2023 14:10:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:09:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea8fc3182797e3691705a9c45e83a16496367904
X-Git-Newrev: 27fd001ce4054e367b371d910ca947e84fcfb7bf
X-Patchwork-Hint: ignore
Message-Id: <20230930141036.6B49983A28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/association.html: move
 buildroot-association to Gitlab
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
Content-Type: multipart/mixed; boundary="===============2292878213402530178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2292878213402530178==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=27fd001ce4054e367b371d910ca947e84fcfb7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The buildroot-association repository used to be hosted on Github, then
was closed for some banking issues. We're now making it public again,
but on Gitlab like the rest of Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/association.html | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/association.html b/docs/website/association.html
index 0215f85874..0c2306f348 100644
--- a/docs/website/association.html
+++ b/docs/website/association.html
@@ -32,21 +32,21 @@
 	  </ul>
 
 	  <p>The bylaws of the association are available
-	  in <a href="https://raw.githubusercontent.com/buildroot/buildroot-association/master/statuts_fr.txt">French</a>
+	  in <a href="https://gitlab.com/buildroot.org/buildroot-association/-/raw/master/statuts_fr.txt">French</a>
 	  (official) and
-	  in <a href="https://github.com/buildroot/buildroot-association/blob/master/statutes_en.txt">English</a>
+	  in <a href="https://gitlab.com/buildroot.org/buildroot-association/-/raw/master/statutes_en.txt">English</a>
 	  (unofficial translation). The association was declared on
 	  March 14, 2016 to the <em>Préfecture de Haute-Garonne</em>
 	  (France) and is registered under the n°W313024278. See this
-	  official <a href="https://github.com/buildroot/buildroot-association/blob/master/pdf/Recepisse_CR.pdf">receipt</a>
+	  official <a href="https://gitlab.com/buildroot.org/buildroot-association/-/raw/master/pdf/Recepisse_CR.pdf">receipt</a>
 	  from the French authorities.</p>
 
 	  <p>Our accounting is fully public, including the bank
 	  account summaries,
-	  see <a href="https://github.com/buildroot/buildroot-association/tree/master/accounting">accounting</a>. Numerous
+	  see <a href="https://gitlab.com/buildroot.org/buildroot-association/-/tree/master/accounting">accounting</a>. Numerous
 	  other administrative documents related to the association
 	  are available on
-	  its <a href="https://github.com/buildroot/buildroot-association/">Github
+	  its <a href="https://gitlab.com/buildroot.org/buildroot-association/">Gitlab
 	  repository</a></p>
 	</div>
       </div>
@@ -68,7 +68,7 @@
 
 	  <p>Once the membership fee is received, it will be listed in
 	  the
-	  association <a href="https://github.com/buildroot/buildroot-association/tree/master/accounting">accounting</a>
+	  association <a href="https://gitlab.com/buildroot.org/buildroot-association/-/tree/master/accounting">accounting</a>
 	  files, which serve as the official list of
 	  members. Therefore, members accept that their name and the
 	  amount of their membership fee is made public.</p>

--===============2292878213402530178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2292878213402530178==--
