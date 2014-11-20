From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Nov 2014 10:48:02 +0000 (UTC)
Subject: [Buildroot] [Bug 7670] Fails to build mpc-1.0.2 on latest Cygwin
In-Reply-To: <bug-7670-163@https.bugs.busybox.net/>
References: <bug-7670-163@https.bugs.busybox.net/>
Message-ID: <20141120104802.421407FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7670

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-20 10:48:01 UTC ---
Clearly, building under Cygwin has basically never been tested, it's currently
not part of the platforms we support, and we never had contributions around
this.

If you're interested in supporting running Buildroot on Cygwin, then you'll
have to investigate the various issues, and contribute fixes back to the
upstream Buildroot. None of the Buildroot core developers are using Buildroot
on Cygwin today.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
