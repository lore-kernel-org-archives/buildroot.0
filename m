From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Aug 2019 21:51:36 +0000
Subject: [Buildroot] [Bug 11961] libpri build failure
In-Reply-To: <bug-11961-163@https.bugs.busybox.net/>
References: <bug-11961-163@https.bugs.busybox.net/>
Message-ID: <bug-11961-163-ScXA29BAPS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11961

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=fe9e709254c3bae8da5428f06a37900269537b64.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
