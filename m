From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Jun 2015 17:40:55 +0000 (UTC)
Subject: [Buildroot] [Bug 8151] x86-64 make fails with ncurses 5.9
In-Reply-To: <bug-8151-163@https.bugs.busybox.net/>
References: <bug-8151-163@https.bugs.busybox.net/>
Message-ID: <20150602174055.3888A81D99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8151

--- Comment #3 from Patricia Holden <patholdn@gmail.com> 2015-06-02 17:40:54 UTC ---
I had 2015.05 loaded.  What I did to make it work is re-install ncurses locally
even though it was at the latest version and then let buildroot build the
toolchain instead of using crosstools-ng which was having same issue.  I
finally got it all built late last night.  Thanks for the quick response!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
