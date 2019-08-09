From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 09 Aug 2019 20:59:11 +0000
Subject: [Buildroot] [Bug 12086] dhcp shared libraries not installed to
 target
In-Reply-To: <bug-12086-163@https.bugs.busybox.net/>
References: <bug-12086-163@https.bugs.busybox.net/>
Message-ID: <bug-12086-163-SqQN8lczWn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12086

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=a404d48e7eeb919b279b4023fee5c9b307ce1f7a.
Thanks Jakob and Carlos!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
