From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Jun 2019 11:42:18 +0000
Subject: [Buildroot] [Bug 11096] Upgrade from glibc 2.26 to 2.27 broke some
 locales (ru_RU in particular)
In-Reply-To: <bug-11096-163@https.bugs.busybox.net/>
References: <bug-11096-163@https.bugs.busybox.net/>
Message-ID: <bug-11096-163-vELpMcyaFp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11096

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=0ec7169e6c8cfb4bb54defb685bd04bb1da0a2aa.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
