From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 13:43:00 +0000
Subject: [Buildroot] [Bug 12836] libunwind: package does not show up in
 menuconfig for aarch64 target
In-Reply-To: <bug-12836-163@https.bugs.busybox.net/>
References: <bug-12836-163@https.bugs.busybox.net/>
Message-ID: <bug-12836-163-TO7lC6IgrA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12836

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?h=next&id=fcfdd8a80dffd1c7c4973d4e359c32372430c83f

-- 
You are receiving this mail because:
You are on the CC list for the bug.
