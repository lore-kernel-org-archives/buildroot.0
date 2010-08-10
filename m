From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Aug 2010 21:59:06 +0000 (UTC)
Subject: [Buildroot] [Bug 779] uClibc (re)building fail
In-Reply-To: <bug-779-163@https.bugs.busybox.net/>
References: <bug-779-163@https.bugs.busybox.net/>
Message-ID: <20100810215906.17FDE8731D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=779

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I finally took the time to try to reproduce the issue today. So what I did is :

 1) Build an ARM OABI toolchain + Busybox system, was successful
 2) Touched uClibc .config file
 3) Restarted the build, and it was successful again

In other words: I haven't been able to reproduce the issue you're describing.
Since the bug has been opened quite a long time ago, it might be possible that
we fixed it in the mean time. Or that I didn't managed to reproduce it because
I didn't fully understand the reproduction procedure detailed below.

As the bug is rather old and since I didn't manage to reproduce it, I'll close
it as WORKSFORME. However, Peter, if you can still reproduce it, do not
hesitate to reopen the bug, and attach your Buildroot .config file. Thanks !

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
