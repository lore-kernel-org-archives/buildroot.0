From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jul 2014 21:06:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7250] Cannot build with -std=c++11
In-Reply-To: <bug-7250-163@https.bugs.busybox.net/>
References: <bug-7250-163@https.bugs.busybox.net/>
Message-ID: <20140708210657.C966E9D1D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7250

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #5498|0                           |1
        is obsolete|                            |

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-08 21:06:57 UTC ---
Created attachment 5510
  --> https://bugs.busybox.net/attachment.cgi?id=5510
Patch to fix the issue for gcc 4.8

This time, here is a Buildroot patch that fixes the issue. Could you test it?
I'm currently build-testing it (and similar patches for gcc 4.7 and 4.9) with
gcc4.7/uclibc, gcc4.8/uclibc, gcc4.9/uclibc and gcc4.8/glibc.

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
