From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Feb 2010 18:11:12 +0000 (UTC)
Subject: [Buildroot] [Bug 1153] Buildroot fails to build packages if
 BR2_GCC_SHARED_LIBGCC=y
In-Reply-To: <bug-1153-163@https.bugs.busybox.net/>
References: <bug-1153-163@https.bugs.busybox.net/>
Message-ID: <20100224181113.0CC9277769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1153


Andy Kennedy <akennedy@drs-tem.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME




--- Comment #2 from Andy Kennedy <akennedy@drs-tem.com>  2010-02-24 18:11:11 UTC ---
After shutting down my computer over the weekend, and then attempting to build
again today, the build was successful.  This must mean that, after the many
attempts to build the system, I had an environmental variable set that was
mucking around with the build.  I'm closing this issue for now, but I will
attempt the build again today to see if it still works (If it fails, I'll
reopen with an env dump).

-- This makes me feel all dirty, like working with Windows.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
