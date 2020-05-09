From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 09 May 2020 13:04:09 +0000
Subject: [Buildroot] [Bug 12841] util-linux/sfdisk 2.35.1 fails on
 sector-size header
In-Reply-To: <bug-12841-163@https.bugs.busybox.net/>
References: <bug-12841-163@https.bugs.busybox.net/>
Message-ID: <bug-12841-163-5w3SClTzqX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12841

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks! Fixed by Fabrice in
https://git.buildroot.org/buildroot/commit/?id=af787a4cf5a19c3411d83ddbd8840b9486b6fcad

-- 
You are receiving this mail because:
You are on the CC list for the bug.
