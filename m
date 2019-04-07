From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 Apr 2019 09:56:09 +0000
Subject: [Buildroot] [Bug 11756] package/syslinux: MBR's don't fit because
 of binutils new .note.gnu.property section
In-Reply-To: <bug-11756-163@https.bugs.busybox.net/>
References: <bug-11756-163@https.bugs.busybox.net/>
Message-ID: <bug-11756-163-FCxG1KDQQ8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11756

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git, thanks:
https://git.buildroot.org/buildroot/commit/?id=0ca17cdc925124d1b309788518e9d4834b9b2557

-- 
You are receiving this mail because:
You are on the CC list for the bug.
