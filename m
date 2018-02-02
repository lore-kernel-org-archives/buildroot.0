From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Feb 2018 21:47:38 +0000
Subject: [Buildroot] [Bug 10736] Recent versions of aufs-util package do not
 build
In-Reply-To: <bug-10736-163@https.bugs.busybox.net/>
References: <bug-10736-163@https.bugs.busybox.net/>
Message-ID: <bug-10736-163-68yigi4W7x@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10736

Alex <alexander.hildebrand@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Alex <alexander.hildebrand@gmail.com> ---
Seems to only happen if activating aufs after building kernel. Completely
rebuilding the kernel resolved the issue for me

-- 
You are receiving this mail because:
You are on the CC list for the bug.
