From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Jul 2015 23:10:07 +0000 (UTC)
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <bug-8206-163@https.bugs.busybox.net/>
References: <bug-8206-163@https.bugs.busybox.net/>
Message-ID: <20150710231007.9C8FC8188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8206

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-10 23:10:04 UTC ---
Should be fixed by
http://git.buildroot.net/buildroot/commit/?id=df8bfa3f8c0c825655fac68a22b6b95039c5bd14.
Thanks Bernd!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
