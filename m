From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Mar 2011 23:18:28 +0000 (UTC)
Subject: [Buildroot] [Bug 3475] Calling sync on large filesystems when not
 always necessary
In-Reply-To: <bug-3475-163@https.bugs.busybox.net/>
References: <bug-3475-163@https.bugs.busybox.net/>
Message-ID: <20110311231828.568528DFC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3475

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  ---
I think it makes more sense to simply get rid of the sync. There's no real
reason why we would need to sync in the first place.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
