From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 24 Apr 2021 15:45:04 +0000
Subject: [Buildroot] [Bug 13771] package htop has undeclared dependency on
 host python
In-Reply-To: <bug-13771-163@https.bugs.busybox.net/>
References: <bug-13771-163@https.bugs.busybox.net/>
Message-ID: <bug-13771-163-ivXQ9zokVZ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13771

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |RESOLVED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Anders, All,

Thanks for the report.

> >>> htop 2.2.0 Building

Both the master and LTS 2021.02.x (against which this bug is open)
branches have htop 3.0.5. Only the old, now unmaintained LTS 2020.02.x
has htop 2.2.0, and unmaintained 2020.11.x has 3.0.2 (first htop
version that no longer needs python).

Closing because none of the still-maintained branches are affected.
Please upgrade.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
