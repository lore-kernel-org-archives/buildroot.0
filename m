From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Nov 2017 22:40:50 +0000
Subject: [Buildroot] [Bug 10326] mesa3d package fails to build when
 BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <bug-10326-163@https.bugs.busybox.net/>
References: <bug-10326-163@https.bugs.busybox.net/>
Message-ID: <bug-10326-163-KxrgMCnwev@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10326

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=dd09d500aa6972808b2549e4b8c7fa4e396ca91f.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
