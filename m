From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 May 2013 13:51:32 +0000 (UTC)
Subject: [Buildroot] [Bug 5828] Possible issue with python
In-Reply-To: <bug-5828-163@https.bugs.busybox.net/>
References: <bug-5828-163@https.bugs.busybox.net/>
Message-ID: <20130504135132.CE85399AAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5828

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-05-04 13:51:41 UTC ---
Do you intend to install python packages directly from the target into the
target? (not from buildroot)
The recommended way if you're missing packages is to create new ones in
buildroot.
And since the toolchain in the target has been deprecated only pure python
packages would work your way.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
