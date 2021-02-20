From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Feb 2021 17:38:15 +0000
Subject: [Buildroot] [Bug 13541] 2021.02.rc2: irqbalance: Daemon couldn't be
 bound to the file-based socket
In-Reply-To: <bug-13541-163@https.bugs.busybox.net/>
References: <bug-13541-163@https.bugs.busybox.net/>
Message-ID: <bug-13541-163-VZ5t4lEKIr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13541

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Alfredo, All,

This is now supposedly fixed with commits 60518c1d7680 and 4a95f38f3064 from
Peter:
   
https://git.buildroot.org/buildroot/commit/?id=60518c1d7680bff5efe879ee86f48e6092239c03
   
https://git.buildroot.org/buildroot/commit/?id=4a95f38f306411ca750a676b81326dc7ec67bcaa

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
