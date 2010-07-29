From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jul 2010 19:27:28 +0000 (UTC)
Subject: [Buildroot] [Bug 1225] Buildroot fails to account for "nof"
 subdirectory (no floating point)
In-Reply-To: <bug-1225-163@https.bugs.busybox.net/>
References: <bug-1225-163@https.bugs.busybox.net/>
Message-ID: <20100729192728.BFA3483695@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1225

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This bug is "fixed" by the fact that we don't allow multilib toolchain builds
anymore, since
http://git.buildroot.net/buildroot/commit/?id=5575d205c35942d992db636a4f7caa246340bd0c

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
