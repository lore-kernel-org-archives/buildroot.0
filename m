From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Nov 2015 10:27:47 +0000 (UTC)
Subject: [Buildroot] [Bug 8456] Building host-pkgconf on Fedora 23 fails due
 to incorrect build dependencies
In-Reply-To: <bug-8456-163@https.bugs.busybox.net/>
References: <bug-8456-163@https.bugs.busybox.net/>
Message-ID: <20151111102747.B57188010F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8456

--- Comment #2 from Dr I J Ormshaw <ian_ormshaw@waters.com> 2015-11-11 10:27:46 UTC ---
Yes I agree removing LD_LIBRARY_PATH is a much better solution.  I had thought
of that as a possibility myself, but didn't suggest it because of the amount of
work involved.  As I need to get my build working again quickly I will probably
do the coreutils fix as a stop gap.  If I do do this, I will, of course, make a
patch available.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
