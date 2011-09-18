From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 16:01:18 +0000 (UTC)
Subject: [Buildroot] [Bug 3145] jffs2 image generation fails
In-Reply-To: <bug-3145-163@https.bugs.busybox.net/>
References: <bug-3145-163@https.bugs.busybox.net/>
Message-ID: <20110918160118.C7D068D5D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3145

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Generating JFFS2 filesystems work just fine with Buildroot 2011.08. This bug
has been fixed in multiple ways: the mtd package has been upgraded, host-lzo is
now compiled as a shared library.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
