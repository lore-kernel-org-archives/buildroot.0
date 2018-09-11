From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 13:02:25 +0000
Subject: [Buildroot] [Bug 11321] Latest master fails to build readline with
 RELRO FULL
In-Reply-To: <bug-11321-163@https.bugs.busybox.net/>
References: <bug-11321-163@https.bugs.busybox.net/>
Message-ID: <bug-11321-163-dDFC402Vuc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11321

--- Comment #1 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Would you mind providing an example defconfig that reproduces this?  I'm
working on an update to the hardening approach, as there are link time issues
with the way the current flags are included.  This maybe related to your issue
and I'll give it a test.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
