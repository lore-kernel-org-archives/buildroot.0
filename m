From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Jan 2015 22:47:12 +0000 (UTC)
Subject: [Buildroot] [Bug 7826] Building of cdparanoia
In-Reply-To: <bug-7826-163@https.bugs.busybox.net/>
References: <bug-7826-163@https.bugs.busybox.net/>
Message-ID: <20150124224712.C8559803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7826

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> 2015-01-24 22:47:11 UTC ---
(In reply to comment #0)
> I tried to package cdparanoia by myself. 

 In order for us to help us, you will need to give more information.

* The .config you use;
* The custom Config.in and cdparanoia.mk files you have made.

 BTW for this kind of question we prefer to use the mailing list rather than
bugzilla.

> This is what I get:
> 
> checking for grep that handles long lines and -e... /bin/grep
> checking for egrep... /bin/grep -E
> checking for ANSI C header files... no
> checking for sys/types.h... no
> checking for sys/stat.h... no
> checking for stdlib.h... no

 There's clearly something wrong with the compiler. Check the settings of CC
and CFLAGS that you add to the configure script. Did you use autotools-package?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
