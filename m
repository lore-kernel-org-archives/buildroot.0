From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Oct 2011 22:16:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4165] lrzsz-fix-symlink-at-rebuild.patch
In-Reply-To: <bug-4165-163@https.bugs.busybox.net/>
References: <bug-4165-163@https.bugs.busybox.net/>
Message-ID: <20111009221626.1B81D8E2EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4165

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  ---
ln -sf would be simpler. I've committed a fix doing that to git, thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
