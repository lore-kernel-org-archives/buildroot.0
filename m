From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Nov 2014 09:15:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
In-Reply-To: <bug-7568-163@https.bugs.busybox.net/>
References: <bug-7568-163@https.bugs.busybox.net/>
Message-ID: <20141110091543.9592FB259C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-10 09:15:41 UTC ---
(In reply to comment #5)
> Okay, found the problem.
> 
> Not a clean build environment, and I was using the following as a quick and
> dirty 'clean':
> 
> http://lists.busybox.net/pipermail/buildroot/2012-September/058323.html

We always rejected merging such "tricks", specifically because they cause
people to not do proper full rebuilds when necessary :-)

> If I distclean then build, it all works fine.
> 
> Really sorry for wasting your time.

No problem, thanks for investigating on your side, and thanks in the first
place for taking the time to report the issues you're seeing.

I'm marking the bug as "worksforme".

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
