From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Aug 2017 20:10:24 +0000
Subject: [Buildroot] [Bug 10261] Grub2 fails to build for x86_64
In-Reply-To: <bug-10261-163@https.bugs.busybox.net/>
References: <bug-10261-163@https.bugs.busybox.net/>
Message-ID: <bug-10261-163-eJCelzgLvf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10261

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=2a27294e9ade6130a12ced9a1f152c51431a870e.
Thanks Erico!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
