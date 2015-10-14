From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 09:41:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8316] lttng-tools and lttng-babeltrace executables
 contain bad RPATH pointing to host machine
In-Reply-To: <bug-8316-163@https.bugs.busybox.net/>
References: <bug-8316-163@https.bugs.busybox.net/>
Message-ID: <20151014094104.AB2D27FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8316

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-14 09:41:04 UTC ---
As I indicated in my previous comment, since it is not really a bug. There are
plenty of packages which hardcode invalid (i.e host RPATH) in their binaries,
and that generally doesn't cause any problem.

We'll hopefully solve this problem once Samuel's work around RPATH tweaking
gets merged.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
