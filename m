From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Apr 2020 05:09:24 +0000
Subject: [Buildroot] [Bug 12796] Update OpenSSL to Version 1.1.1g to patch
 CVE-2020-1967
In-Reply-To: <bug-12796-163@https.bugs.busybox.net/>
References: <bug-12796-163@https.bugs.busybox.net/>
Message-ID: <bug-12796-163-KoHVJhv31s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12796

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks, it's already fixed by
https://git.buildroot.org/buildroot/commit/?id=849aee4f8805cce89376c0cd1ce23721436a90ac.
As it is a security bump, it will be backported to our 2020.02.x LTS branch.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
