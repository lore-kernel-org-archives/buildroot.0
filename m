From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Sep 2014 12:44:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7448] Having export MACHINE="something" breaks
 glibc build on IMX6 target
In-Reply-To: <bug-7448-163@https.bugs.busybox.net/>
References: <bug-7448-163@https.bugs.busybox.net/>
Message-ID: <20140923124422.C2DB59D75E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7448

--- Comment #1 from Risto Avila <risto.avila@digia.com> 2014-09-23 12:44:22 UTC ---
Created attachment 5678
  --> https://bugs.busybox.net/attachment.cgi?id=5678
Possible fix to unset MACHINE

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
