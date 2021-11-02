Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3112DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6D0860C4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 20:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6D0860C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F2F80DC0;
	Tue,  2 Nov 2021 20:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OlDBY6aKUVJs; Tue,  2 Nov 2021 20:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF1680DC9;
	Tue,  2 Nov 2021 20:34:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61ECC1BF40F
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514DC402F7
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 20:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eX4oBUko4xN for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 20:34:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6DBD4019B
 for <buildroot@uclibc.org>; Tue,  2 Nov 2021 20:34:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 8A82A89141; Tue,  2 Nov 2021 20:30:52 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Tue, 02 Nov 2021 20:34:31 +0000
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
Message-ID: <bug-14046-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14046] New: How do I log into my router without a
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

https://bugs.busybox.net/show_bug.cgi?id=14046

            Bug ID: 14046
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
            Status: RESOLVED
        Resolution: INVALID

Hello, I am John Smith, I am a technical advisor for any computer software
related to Garmin, McAfee, Office, Norton Setup, AOL Mail, etc. If you have any
problems related to computer software issues, then please contact us.


Visit Our Websites:-


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


http://bit.ly/3p8AaKq

http://bit.ly/3sK5iCr

http://bit.ly/2LR8fAk

http://bit.ly/3jI6xOx

http://bit.ly/2Oc803G

http://bit.ly/2Pp1Ttq

http://bit.ly/2Qk6g9M

http://bit.ly/3txX8ww

http://bit.ly/39Ol3R1

http://bit.ly/3rVl7ED

http://bit.ly/3tahnjS

http://bit.ly/3dUobM8

http://bit.ly/3cYEiZz

http://bit.ly/2TUUmoW

http://bit.ly/3wAu7RU

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
