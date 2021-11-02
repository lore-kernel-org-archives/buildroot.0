Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29936C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:34:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA54604DA
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBA54604DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 861E3403F2;
	Tue,  2 Nov 2021 20:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1NXQ6cd3T6D; Tue,  2 Nov 2021 20:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A0D403F1;
	Tue,  2 Nov 2021 20:34:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1191BF40F
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 468574031E
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:34:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZmh9zh7SAeB for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 20:34:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 557C44019B
 for <buildroot@uclibc.org>; Tue,  2 Nov 2021 20:34:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1719A89141; Tue,  2 Nov 2021 20:30:26 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 02 Nov 2021 20:34:05 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aduskett@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone resolution
Message-ID: <bug-14051-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14051] New: How do I log into my router without a
 password?
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

https://bugs.busybox.net/show_bug.cgi?id=14051

            Bug ID: 14051
           Summary: How do I log into my router without a password?
           Product: buildroot
           Version: 2021.02.1
          Hardware: All
                OS: Linux
            Status: RESOLVED
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: shamrahul444@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---
        Resolution: INVALID
            Status: RESOLVED

Hello, I am John Smith, I am a technical advisor for any computer software
related to Garmin, McAfee, Office, Norton Setup, AOL Mail, etc. If you have any
problems related to computer software issues, then please contact us.

http://magellan-gps-update.com/
http://gonortoncomsetup.com/
http://imcafeecomactivatez.com/
http://garminexpress.us/
http://linksysextendersetupp.com
https://sites.google.com/view/aolmailloginsteps
https://sites.google.com/view/registeramazoncomcode
https://sites.google.com/view/paypallogin-usa
https://sites.google.com/view/mywifiext-us
https://sites.google.com/view/tomtomupdateguide
https://sites.google.com/view/123hpcomguide
https://sites.google.com/view/extenderlinksyscom-usa
https://sites.google.com/view/belkinn300setup
https://sites.google.com/view/gonortonlogin
https://sites.google.com/view/getmcafeelogin
https://sites.google.com/view/outlook365loginguide
https://sites.google.com/view/thenortoncomsetup
https://sites.google.com/view/shawwebmailca
https://sites.google.com/view/portalofficecomdesk
https://sites.google.com/view/garminexpressguide

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
