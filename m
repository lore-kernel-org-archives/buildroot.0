From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Sep 2009 07:50:01 +0000 (UTC)
Subject: [Buildroot] [Bug 617] netkit/inetd requires RPC and fails to build
 if RPC is disabled
In-Reply-To: <bug-617-163@https.bugs.busybox.net/>
References: <bug-617-163@https.bugs.busybox.net/>
Message-ID: <20090919075001.69981776ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=617


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-09-19 07:50:00 UTC ---
Thanks. There was a missing kconfig dependency on netkitbase - Fixed in git
(f5239c327e3). I agree with Bernhard though, unless you have very specific
reasons to use netkittelnet I would very much suggest you use the busybox
telnet(d) applets instead.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
