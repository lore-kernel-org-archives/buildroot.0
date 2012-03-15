From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Mar 2012 09:33:19 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20120315093319.5C48090DA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

--- Comment #2 from Christoph Schulz <develop@kristov.de> 2012-03-15 09:33:19 UTC ---
I do not want to encourage using a patched make. I only want to let the user
this possibility. Following your first argument, this implies for me that we
should also ban host-autoconf, host-automake etc. from the buildroot because
they need not be specially configured for cross-compiling and, consequently,
one could easily require the host environment to provide them (as it is
currently done for 'make'). So I really fail to see how 'make' does not fit
into the rest of the 'host-' packages.

By the way, autoconf e.g. does get patched in the buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
