From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 18:08:55 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20100221180855.D00747776C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545


Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 18:08:55 UTC ---
Proposed fix in
http://lists.busybox.net/pipermail/buildroot/2010-February/032142.html

The proposed fix is just to include a copy of gtk-doc.make into Webkit.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
