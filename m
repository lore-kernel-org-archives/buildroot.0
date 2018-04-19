From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Apr 2018 21:33:03 +0000
Subject: [Buildroot] [Bug 10961] [Buildroot 2018.02] Grub2 fails to build
 for x86_64 when BR2_SSP_ALL is enabled
In-Reply-To: <bug-10961-163@https.bugs.busybox.net/>
References: <bug-10961-163@https.bugs.busybox.net/>
Message-ID: <bug-10961-163-as3TbEDVi7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10961

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=523b27afa941bc0a78f7b2eae8e97329c112782d.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
