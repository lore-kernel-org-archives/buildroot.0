From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 Nov 2015 23:06:08 +0000 (UTC)
Subject: [Buildroot] [Bug 8456] Building host-pkgconf on Fedora 23 fails due
 to incorrect build dependencies
In-Reply-To: <bug-8456-163@https.bugs.busybox.net/>
References: <bug-8456-163@https.bugs.busybox.net/>
Message-ID: <20151118230608.EEA077FC34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8456

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-11-18 23:06:08 UTC ---
Ian, All,

Fixed by this commit:
http://git.buildroot.net/buildroot/commit/?id=34d081674ab8f0ffad84e5a18d3c67855826262f

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
