From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  6 Sep 2014 21:48:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit builds a static application,
 even though BR2_PREFER_STATIC_LIB is not set, and with glibc.
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140906214841.D90EC9D537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #12 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-09-06 21:48:40 UTC ---
Hello!

We believe this isuue has now been fixed with this changeset:
   
http://git.buildroot.org/buildroot/commit/?id=03f388619a4dfa2835774702a54504b56e2e00e0

I'm closing the issue now. If you believe this does not fix your
problem, be sure to re-open this issue for further investigations.

Thank you for the report! :-)

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
