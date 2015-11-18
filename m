From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Nov 2015 21:17:07 +0000 (UTC)
Subject: [Buildroot] [Bug 4790] Running udhcpc on a system with NFS root
	kills NFS
In-Reply-To: <bug-4790-163@https.bugs.busybox.net/>
References: <bug-4790-163@https.bugs.busybox.net/>
Message-ID: <20151118211707.C47BC7FB11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4790

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-18 21:17:07 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/?h=next&id=71c75a5ea0e62786d279ef1609f23732bde5acc3.
Will be part of 2016.02.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
