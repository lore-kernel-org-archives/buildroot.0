Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C5EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8956C60A78;
	Tue, 10 Sep 2024 20:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4SfGzTyvWrU; Tue, 10 Sep 2024 20:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A49560A77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A49560A77;
	Tue, 10 Sep 2024 20:52:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1490C1BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 786DC608B6
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDdyA9vqMcl8 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB066608BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB066608BB
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A88A786F5F; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d729696451c899b8db149f9f6346db3f1b678ad5
X-Git-Newrev: 6cb031802d100b36c086b1a732bf887bf4304aab
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.A88A786F5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/copyright.txt: fix aboard typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cb031802d100b36c086b1a732bf887bf4304aab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/copyright.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/copyright.txt b/docs/website/copyright.txt
index 3fe19bab8b..4d19bbf828 100644
--- a/docs/website/copyright.txt
+++ b/docs/website/copyright.txt
@@ -18,7 +18,7 @@ GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR
 INABILITY TO USE THIS WEBSITE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR
 LOSS OF HAIR, LOSS OF LIFE, LOSS OF MEMORY, LOSS OF YOUR CARKEYS, MISPLACEMENT
 OF YOUR PAYCHECK, OR COMMANDER DATA BEING RENDERED UNABLE TO ASSIST THE
-STARFLEET OFFICERS ABORD THE STARSHIP ENTERPRISE TO RECALIBRATE THE MAIN
+STARFLEET OFFICERS ABOARD THE STARSHIP ENTERPRISE TO RECALIBRATE THE MAIN
 DEFLECTOR ARRAY, LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE
 WEBSITE TO OPERATE WITH YOUR WEBBROWSER), EVEN IF SUCH HOLDER OR OTHER PARTY
 HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
