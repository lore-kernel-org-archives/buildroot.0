From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 07 May 2017 14:08:56 +0000
Subject: [Buildroot] [Bug 9436] e2fsprogs remove busybox applets even of
 unselected e2fsprogs components
In-Reply-To: <bug-9436-163@https.bugs.busybox.net/>
References: <bug-9436-163@https.bugs.busybox.net/>
Message-ID: <bug-9436-163-gc2T8BnNPG@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9436

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/package/e2fsprogs?id=742d6bf13e5bddc5e30edeb8b8c314f47cf97e4d.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
