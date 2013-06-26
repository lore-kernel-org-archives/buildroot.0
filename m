From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jun 2013 11:50:40 +0000 (UTC)
Subject: [Buildroot] [Bug 6344] Wrong handling of license text files with
 same name and different directory
In-Reply-To: <bug-6344-163@https.bugs.busybox.net/>
References: <bug-6344-163@https.bugs.busybox.net/>
Message-ID: <20130626115041.5729B9AF03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6344

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-06-26 11:48:50 UTC ---
This has already been fixed in Git by commit
31aa4264d8839d05684e67a238837e8633d1e1bc. See
http://git.buildroot.net/buildroot/commit/?id=31aa4264d8839d05684e67a238837e8633d1e1bc.

Thanks for the report!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
