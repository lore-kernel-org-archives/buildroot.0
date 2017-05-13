From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 13 May 2017 13:13:32 +0000
Subject: [Buildroot] [Bug 9796] source-check broken for Git downloads
In-Reply-To: <bug-9796-163@https.bugs.busybox.net/>
References: <bug-9796-163@https.bugs.busybox.net/>
Message-ID: <bug-9796-163-6fS3Eht6sc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9796

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=4c0aacbc317d298397cede593f74ece26d0a89f0.
Thanks a lot Yann!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
