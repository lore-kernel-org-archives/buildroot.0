From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 17:50:56 +0000 (UTC)
Subject: [Buildroot] [Bug 469] build of libgtk2 for host incorrectly assumes
 that X.org development files are installed
In-Reply-To: <bug-469-163@https.bugs.busybox.net/>
References: <bug-469-163@https.bugs.busybox.net/>
Message-ID: <20100221175056.7B3707776C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=469


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 17:50:55 UTC ---
I've submitted today a patch to fix this:
 http://lists.busybox.net/pipermail/buildroot/2010-February/032129.html

However, the patch and solution is not clean enough to be submitted to the Gtk
project.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
