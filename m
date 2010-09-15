From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Sep 2010 11:50:06 +0000 (UTC)
Subject: [Buildroot] [Bug 2563] [PATCH] cairo: Expose the configure option
 to disable some floating-point math
In-Reply-To: <bug-2563-163@https.bugs.busybox.net/>
References: <bug-2563-163@https.bugs.busybox.net/>
Message-ID: <20100915115006.4271C8A710@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2563

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
I don't have any problems with the option as such, but right now this option
doesn't do anything in cairo, so adding it seems pretty pointless:

grep -rls DISABLE_SOME_FLOATING_POINT cairo-1.8.10
cairo-1.8.10/configure
cairo-1.8.10/config.h.in
cairo-1.8.10/configure.ac

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
