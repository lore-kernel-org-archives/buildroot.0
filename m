From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 13:19:29 +0000
Subject: [Buildroot] [Bug 11641] linux kernel .config timestamp always out
 of date fixed with KCONFIG_NOSILENTUPDATE
In-Reply-To: <bug-11641-163@https.bugs.busybox.net/>
References: <bug-11641-163@https.bugs.busybox.net/>
Message-ID: <bug-11641-163-awn1zc7LtC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11641

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report! This was fixed by commit
https://git.buildroot.org/buildroot/commit/?id=05fea6e4a60a38a797d9bacbf318a2cd7dbd435f.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
