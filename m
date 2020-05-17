From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 18:52:38 +0000
Subject: [Buildroot] [Bug 12826] nodejs-12.16.1: error: 'uv_sleep' was not
 declared in this scope
In-Reply-To: <bug-12826-163@https.bugs.busybox.net/>
References: <bug-12826-163@https.bugs.busybox.net/>
Message-ID: <bug-12826-163-761OKIbcTV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12826

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I am sorry, but neither Peter Seiderer nor myself have been able to reproduce
the issue on 2020.02.1. I tested exactly the first defconfig you posted, and it
builds fine.

The libuv version 2020.02.1 does implement uv_sleep(), both the libuv package
and the libuv shipped with nodejs, so I don't see how your build failure could
happen.

Are you sure you did a full rebuild with 2020.02.1 ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
