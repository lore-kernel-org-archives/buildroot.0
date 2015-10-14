From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 20:50:56 +0000 (UTC)
Subject: [Buildroot] [Bug 8401] gpsd 3.15 NMEA support
In-Reply-To: <bug-8401-163@https.bugs.busybox.net/>
References: <bug-8401-163@https.bugs.busybox.net/>
Message-ID: <20151014205056.3556981D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8401

--- Comment #2 from kevin.alden2 at gmail.com 2015-10-14 20:50:56 UTC ---
(In reply to comment #1)
> Thanks for your report. Can you point to the upstream commit that fixes the
> problem? I've looked quickly into gpsd's git repository, and I don't see this
> problem fixed.

http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=3e25e2167beb3936de3986fad9b6c9bdec82b81f

It looks like they fixed the problem by changing the #ifdefs in the code as
opposed to changing the SConstruct file back

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
