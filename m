From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 May 2011 22:13:56 +0000 (UTC)
Subject: [Buildroot] [Bug 3781] crosstool-ng-1.11.3 fails to build
In-Reply-To: <bug-3781-163@https.bugs.busybox.net/>
References: <bug-3781-163@https.bugs.busybox.net/>
Message-ID: <20110526221356.1950083679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3781

Yann E. MORIN <yann.morin.1998@anciens.enib.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |yann.morin.1998 at anciens.eni
                   |.org                        |b.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@anciens.enib.fr>  ---
Created attachment 3325
  --> https://bugs.busybox.net/attachment.cgi?id=3325
Force symlink creation

Please, try applying this patch to crosstool-NG, and re-run.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
