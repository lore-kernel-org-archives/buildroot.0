From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Oct 2016 21:33:48 +0000
Subject: [Buildroot] [Bug 8646] check-host-rpath script returns false
 positives when rpath contains symlink
In-Reply-To: <bug-8646-163@https.bugs.busybox.net/>
References: <bug-8646-163@https.bugs.busybox.net/>
Message-ID: <bug-8646-163-0MkxfNXmB3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8646

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This bug is now fixed thanks to the patches from Samuel that ensure that the
output directory is a canonical path. See the following commit:

https://git.buildroot.org/buildroot/commit/?id=173135df5b69dfd5ae6fe6cf2de8833c6f74c143

-- 
You are receiving this mail because:
You are on the CC list for the bug.
