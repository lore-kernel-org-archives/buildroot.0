From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Apr 2010 13:46:46 +0000 (UTC)
Subject: [Buildroot] [Bug 1393] neon config fails libxml/parser.h: libxml2
 requires, but not dependent on, libiconv
In-Reply-To: <bug-1393-163@https.bugs.busybox.net/>
References: <bug-1393-163@https.bugs.busybox.net/>
Message-ID: <20100402134646.6CD6E8B74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1393


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-04-02 13:46:46 UTC ---
The problem rather seems to be that neon somehow end up looking at your host
includes, instead of the ones in staging/usr/include.

I cannot reproduce it here, please provide more details about your setup (and
your .config)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
