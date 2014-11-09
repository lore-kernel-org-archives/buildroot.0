From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Nov 2014 13:26:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7358] rpi-userland: linking with bcm_host doesn't
 give vc_dispmanx_* functions
In-Reply-To: <bug-7358-163@https.bugs.busybox.net/>
References: <bug-7358-163@https.bugs.busybox.net/>
Message-ID: <20141109132621.CB2BBB11F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7358

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-09 13:26:21 UTC ---
Unfortunately, there was no further feedback from the original submitter.
However, it seems the problem was more in the packaging of SDL2 (which isn't in
Buildroot as of today) and not in Buildroot itself.

Marteen, it would be good if you could submit your SDL2 patches at some point.

In the mean time, I'll mark the bug as resolved/invalid. Feel free to re-open
it if you disagree.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
