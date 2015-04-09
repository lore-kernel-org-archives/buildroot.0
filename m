From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Apr 2015 14:18:31 +0000 (UTC)
Subject: [Buildroot] [Bug 7874] X.org configure error
In-Reply-To: <bug-7874-163@https.bugs.busybox.net/>
References: <bug-7874-163@https.bugs.busybox.net/>
Message-ID: <20150409141831.3C22781914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7874

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-09 14:18:31 UTC ---
I also tested the configuration, on Buildroot 2014.11, and it builds fine. I
believe your problem was probably due to the fact that you didn't do a full
rebuild ('make clean all') after doing some configuration changes.

See http://buildroot.org/downloads/manual/manual.html#full-rebuild for more
details.

I'm closing the bug. Do not hesitate to reopen if you're still experiencing the
issue after a 'make clean all'.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
