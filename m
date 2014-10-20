From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Oct 2014 19:13:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7280] CMake toolchain file uses the FORCE
 attribute on CMAKE_CXX_FLAGS
In-Reply-To: <bug-7280-163@https.bugs.busybox.net/>
References: <bug-7280-163@https.bugs.busybox.net/>
Message-ID: <20141020191342.A2F3DAFD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7280

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-20 19:13:42 UTC ---
Bug fixed with commit
http://git.buildroot.net/buildroot/commit/?id=47544e43a5e36f6c4ee1acb06315ab974cde78b4
and will be part of 2014.11.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
