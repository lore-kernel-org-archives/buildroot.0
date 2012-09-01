From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Sep 2012 13:29:07 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on:
 libs/libglib-2.0.so: undefined reference to `qsort_r'
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120901132907.9111A994ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

twobob <seetwobob@live.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #9 from twobob <seetwobob@live.co.uk> 2012-09-01 13:29:07 UTC ---
In essence, this doesn't happen using the Buildroot installed Code Sourcery
Toolchains.

For my use case I was attempting to utitlise a pre-installed chain.
It was possibly too old a version.

Using the 2011 TC fixes this. So I will set it as a non issue and possibly add
a note when I figure out the oldest CS TC that *will* build this without error.

(I run all this on a 3rd gen kindle, no really)
Thanks for all your help.

If I find something *actually* useful to contribute I will.
Regards.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
