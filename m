From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 25 Feb 2018 21:36:01 +0000
Subject: [Buildroot] [Bug 10726] Current libglib2.mk creates broken libglib2
 binary when using glibc 2.26
In-Reply-To: <bug-10726-163@https.bugs.busybox.net/>
References: <bug-10726-163@https.bugs.busybox.net/>
Message-ID: <bug-10726-163-TsSpklyrKe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10726

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=eb1a45f4c1e01fa1af7ad3dbbd6b2bade7fc958d.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
