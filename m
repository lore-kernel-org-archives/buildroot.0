From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Nov 2017 20:46:37 +0000
Subject: [Buildroot] [Bug 10501] host-localedef fails to compile on Ubuntu
 17.10
In-Reply-To: <bug-10501-163@https.bugs.busybox.net/>
References: <bug-10501-163@https.bugs.busybox.net/>
Message-ID: <bug-10501-163-luTp8VridF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10501

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=d5cc76c5314f58fa18001e9abce196c1ac4a28d1.
Thanks Marcus for reporting the problem in the first place, and thanks Peter
for providing a fix!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
