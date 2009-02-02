From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Feb 2009 21:36:23 +0000 (UTC)
Subject: [Buildroot] [Bug 83] liblockfile fails to compile due to eaccess
	redefinition
In-Reply-To: <bug-83-163@https.bugs.busybox.net/>
References: <bug-83-163@https.bugs.busybox.net/>
Message-ID: <20090202213623.75251764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=83


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jacmet at uclibc.org
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-02 21:36:22 UTC ---
That seems to be a bug in your toolchain then, it builds with the standard
toolchain in BR (4.3.2) for me.

What's the reason for using a crosstool toolchain instead?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
