From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jul 2010 15:17:11 +0000 (UTC)
Subject: [Buildroot] [Bug 777] Microperl doesn't build - Unterminated quoted
 string in makedepend.SH
In-Reply-To: <bug-777-163@https.bugs.busybox.net/>
References: <bug-777-163@https.bugs.busybox.net/>
Message-ID: <20100726151711.BF8F782DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=777

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Microperl builds just fine here with the latest git, even though I admit that
the patch at http://rt.perl.org/rt3//Public/Bug/Display.html?id=44581 is indeed
fixing a syntax error.

However, could you be more specific about the second Makefile issue you had ?

Moreover, could you attach the Buildroot .config file with which you are
producing those issues ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
