From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2015 13:51:46 +0000 (UTC)
Subject: [Buildroot] [Bug 8496] Toolchain -> Target Optimizations ignored &
	not applied.
In-Reply-To: <bug-8496-163@https.bugs.busybox.net/>
References: <bug-8496-163@https.bugs.busybox.net/>
Message-ID: <20151130135146.A6AB181D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8496

brandurs at yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |

--- Comment #2 from brandurs at yahoo.com 2015-11-30 13:51:46 UTC ---

Apparently no "Target Optimizations" are applied to the CFLAGS and CXXFLAGS,
but "Target Linker Options" are applied to LDFLAGS. ?
Is this a white flag to red flags? 

"-mtune=xscale" was an example, my documentation states armv5te compatible with
xscale core, and I follow that advice. But that fact is irrelevant in this
bug-report. 

Other uses could be "-flto -fgraphite-identity". These flags are apparently not
applied to CFLAGS or the compilation. None are.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
