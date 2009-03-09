From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Mar 2009 13:30:13 +0000 (UTC)
Subject: [Buildroot] [Bug 153] not able to build buildroot
In-Reply-To: <bug-153-163@https.bugs.busybox.net/>
References: <bug-153-163@https.bugs.busybox.net/>
Message-ID: <20090309133014.02771764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=153


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |ASSIGNED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-09 13:30:13 UTC ---
More userfriendliness would certainly be good, but the NTPL support is work in
progress, and the option is mainly there for easy testing. The help text says:

Not all thread variants work with all versions of uClibc,
the "linuxthreads (stable/old)" may be a working fallback
if you need threading at all.

Do you have any suggestions on how to make this more clear?

Regarding your build issues: Please make sure you are building from a clean
tree (do a new checkout or run rm -rf *build_*)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
