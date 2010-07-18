From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Jul 2010 17:00:39 +0000 (UTC)
Subject: [Buildroot] [Bug 1261] The getline() in
 output/build/linux-2.6.28/scripts/unifdef.c in buildroot is buggy
In-Reply-To: <bug-1261-163@https.bugs.busybox.net/>
References: <bug-1261-163@https.bugs.busybox.net/>
Message-ID: <20100718170039.B2E6482BA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1261

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This is not a Buildroot bug, but rather a know bug when using old versions of
the kernel in newer distributions. I don't think there's anything Buildroot can
do to fix this.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
