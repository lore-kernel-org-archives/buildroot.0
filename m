From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 20:58:01 +0000 (UTC)
Subject: [Buildroot] [Bug 3319] "make xconfig" takes fatal error
In-Reply-To: <bug-3319-163@https.bugs.busybox.net/>
References: <bug-3319-163@https.bugs.busybox.net/>
Message-ID: <20110218205801.931A08F5C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3319

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
We've recently synched the kconfig stuff with the kernel, and from the error
message it sounds like you have a mix of qt3 and qt4 installed. Please check
your path /environment.

Also see
http://www.linuxquestions.org/questions/linux-software-2/error-when-compiling-app-against-qt4-775969/

As another test you could also try make xconfig with a Linux kernel >= 2.6.37.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
