From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2018 16:07:25 +0000
Subject: [Buildroot] [Bug 11186] Building wireless-regdb fails on BR
 2018.05.1
In-Reply-To: <bug-11186-163@https.bugs.busybox.net/>
References: <bug-11186-163@https.bugs.busybox.net/>
Message-ID: <bug-11186-163-BypR62nE1V@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11186

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is already fixed in the 2018.05.x branch, in commit
https://git.buildroot.org/buildroot/commit/?h=2018.05.x&id=eece13dcecdfc9dd283c068ec64000edb5fb09e4,
and it will be part of the next 2018.05.2 release.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
