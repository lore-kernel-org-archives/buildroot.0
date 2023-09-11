Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2290EEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 18:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 987EB4117A;
	Mon, 11 Sep 2023 18:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 987EB4117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJo7IIxKekMk; Mon, 11 Sep 2023 18:41:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E95BC40A41;
	Mon, 11 Sep 2023 18:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E95BC40A41
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7CF61BF20B
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC641417EC
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 18:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC641417EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yLJwnTIevUA for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 18:41:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA1F41880
 for <buildroot@uclibc.org>; Mon, 11 Sep 2023 18:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA1F41880
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id CB677867C0; Mon, 11 Sep 2023 18:41:09 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 11 Sep 2023 18:41:09 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.4
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jose@source.parts
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14931-163-CzHzXHb7hX@https.bugs.busybox.net/>
In-Reply-To: <bug-14931-163@https.bugs.busybox.net/>
References: <bug-14931-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14931] package/qt5/qt5webengine: build fails with
 unicode/uchar.h not found
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14931

--- Comment #4 from Jose Angel Torres <jose@source.parts> ---
Does anyone have the patch that resolves this issue so we can push it through
and mark this issue as resolved? If not, I can dig back into this but would
rather not have to start from scratch. If anyone on this issue has a moment,
please add it as an attachment to this issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
