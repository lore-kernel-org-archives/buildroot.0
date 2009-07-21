From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2009 12:00:26 +0000 (UTC)
Subject: [Buildroot] [Bug 387] Tremor not installed to toolchain
In-Reply-To: <bug-387-163@https.bugs.busybox.net/>
References: <bug-387-163@https.bugs.busybox.net/>
Message-ID: <20090721120026.755A777806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=387


Sven Neumann <s.neumann@raumfeld.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |




--- Comment #2 from Sven Neumann <s.neumann@raumfeld.com>  2009-07-21 12:00:25 UTC ---
This breaks the build of gst-plugins-base. Looks like there's a fix needed
there as well:

make: *** No rule to make target `libvorbis', needed by
`gst-plugins-base-depends'.  Stop.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
