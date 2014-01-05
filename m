From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 23:20:22 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] genext2fs: e2fsck must run before tunefs -U
	random
In-Reply-To: <bug-6752-163@https.bugs.busybox.net/>
References: <bug-6752-163@https.bugs.busybox.net/>
Message-ID: <20140105232022.2048A81FCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-01-05 23:20:21 UTC ---
Fix in the repository, with:
http://git.buildroot.org/buildroot/commit/?id=9e680d0ada829f1cd7e2e1bff138d5e3ec32d0fd

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
