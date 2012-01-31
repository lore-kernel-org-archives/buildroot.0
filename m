From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 22:15:16 +0000 (UTC)
Subject: [Buildroot] [Bug 4484] libstdc++ has _GLIBCXX_HAVE_FENV_H undefined
 but uclibc appears to have a fenv.h
In-Reply-To: <bug-4484-163@https.bugs.busybox.net/>
References: <bug-4484-163@https.bugs.busybox.net/>
Message-ID: <20120131221516.DC62E90924@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4484

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 22:15:16 UTC ---
I just tried with the latest Buildroot to build a PowerPC toolchain with gcc
4.6 for e500mc, and it just works fine.

If it still doesn't work for you, please post your Buildroot .config file. Your
previous one was incorrect because it was using the 0.9.31 uClibc configuration
with a 0.9.32 uClibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
