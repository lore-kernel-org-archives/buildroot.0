From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  4 May 2013 18:00:41 +0000 (UTC)
Subject: [Buildroot] [Bug 4736] lmbench build failure
In-Reply-To: <bug-4736-163@https.bugs.busybox.net/>
References: <bug-4736-163@https.bugs.busybox.net/>
Message-ID: <20130504180041.3A5A699AB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4736

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-05-04 18:00:48 UTC ---
Custom uclibc configurations are the responsibility of the user, we can't make
buildroot audit every single option for every single package.
That's the reason we've got default samples that are appropiately tweaked by BR
when enabling/disabling toolchain options like WCHAR, RPC, LFS and so on.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
