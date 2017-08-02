From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 20:17:48 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-xX6udwF376@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #16 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The graphite issue with gcc 7.x has been fixed in
https://git.buildroot.org/buildroot/commit/?id=d16b6bf9b9da2d58955bf1abaf15f25c5666b90a
and
https://git.buildroot.org/buildroot/commit/?id=94afc741a0cd837d9549c346babc5b8be68dea5a.
Please open a separate bug report for the Qt5 issue. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
