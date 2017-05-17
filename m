From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 May 2017 14:55:47 +0000
Subject: [Buildroot] [Bug 9871] fbgrab 1.3 won't build with BR2_REPRODUCIBLE
	set
In-Reply-To: <bug-9871-163@https.bugs.busybox.net/>
References: <bug-9871-163@https.bugs.busybox.net/>
Message-ID: <bug-9871-163-vpwojbsQjg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9871

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
fbgrab upstream isn't very active, so it is unlikely that we can get the fix
integrated in the near future. I've submitted a simpler patch that simply
doesn't compress the (unused) man page instead:

https://patchwork.ozlabs.org/patch/763602/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
