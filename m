From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 14:45:17 +0000
Subject: [Buildroot] [Bug 8751] make fail
In-Reply-To: <bug-8751-163@https.bugs.busybox.net/>
References: <bug-8751-163@https.bugs.busybox.net/>
Message-ID: <bug-8751-163-wC14ag4miK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8751

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
fio is now disabled for SuperH, since commit
https://git.busybox.net/buildroot/commit/?id=b0c04616174737dd0b8ff27e73769fc4ea39320c.

I've reported the build problem to the fio project upstream, see
https://github.com/axboe/fio/issues/154.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
