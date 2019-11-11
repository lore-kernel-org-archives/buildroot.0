From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Nov 2019 07:41:11 +0000
Subject: [Buildroot] [Bug 12311] Extra package download failure if the SITE
 include '+'
In-Reply-To: <bug-12311-163@https.bugs.busybox.net/>
References: <bug-12311-163@https.bugs.busybox.net/>
Message-ID: <bug-12311-163-zJLxSJth8k@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12311

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Thanks for the report and the initial patch.

This has now been fixed with:
   
https://git.buildroot.org/buildroot/commit/?id=2c543b4f4c4f06fccadb20e7568a662d3d0b854e

-- 
You are receiving this mail because:
You are on the CC list for the bug.
