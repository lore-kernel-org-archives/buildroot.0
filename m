From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Sep 2009 18:57:47 +0000 (UTC)
Subject: [Buildroot] [Bug 597] (REOP) Selecting busybox in buildroot's
 config clobbers ar (and probably other binutils)
In-Reply-To: <bug-597-163@https.bugs.busybox.net/>
References: <bug-597-163@https.bugs.busybox.net/>
Message-ID: <20090905185747.7FFF577797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=597


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-09-05 18:57:46 UTC ---
(In reply to comment #0)
>
> But now... both busybox 1.11.x.config and 1.13.x.config have CONFIG_AR=y
> (again).

The real solution it probably to ensure that the busybox installation step runs
before the binutils one like it's done for util-linux.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
