From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Mar 2021 20:38:02 +0000
Subject: [Buildroot] [Bug 13631] Commit 54d3d94b6e breaks packages with git
 download method
In-Reply-To: <bug-13631-163@https.bugs.busybox.net/>
References: <bug-13631-163@https.bugs.busybox.net/>
Message-ID: <bug-13631-163-ia41nH4kIv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13631

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Matthias, All,

Thanks for your report!

We believe this has been fixed with commit b70ce56651 (support/download: fix
git/svn corrupted cache) which was just merged.

Care to check on your side that everythig is back to normal?

Regards,
Yann E. MORIN

-- 
You are receiving this mail because:
You are on the CC list for the bug.
