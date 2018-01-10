From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 19:55:53 +0000
Subject: [Buildroot] [Bug 10641] avahi-autoipd not starting when using
 systemd-tmpfiles
In-Reply-To: <bug-10641-163@https.bugs.busybox.net/>
References: <bug-10641-163@https.bugs.busybox.net/>
Message-ID: <bug-10641-163-qc62hQleYH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10641

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks a lot for the bug report. Fixed in commit
https://git.buildroot.org/buildroot/commit/?id=c427ce4d9f54d9b6433969ecb0fc8a4a5a9ba9b5.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
