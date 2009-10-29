From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Oct 2009 20:38:36 +0000 (UTC)
Subject: [Buildroot] [Bug 667] [PATCH] e2fsprogs
In-Reply-To: <bug-667-163@https.bugs.busybox.net/>
References: <bug-667-163@https.bugs.busybox.net/>
Message-ID: <20091029203837.0D38D776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=667


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-10-29 20:38:35 UTC ---
Thanks, committed. The libuuid change could potentially be a problem as you now
need to enable largefile support in toolchain and also enable e2fsprogs, but
OK, there's no users in the tree.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
