From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 18:11:05 +0000 (UTC)
Subject: [Buildroot] [Bug 7358] rpi-userland: linking with bcm_host doesn't
 give vc_dispmanx_* functions
In-Reply-To: <bug-7358-163@https.bugs.busybox.net/>
References: <bug-7358-163@https.bugs.busybox.net/>
Message-ID: <20141026181105.4813FB08C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7358

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-26 18:11:04 UTC ---
So, in the end there is no real bug here? It's really SDL2 that should be
fixed, and since we don't yet have a SDL2 package, this is not a bug for now,
right?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
