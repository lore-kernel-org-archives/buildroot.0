From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 07:28:59 +0000
Subject: [Buildroot] [Bug 12901] GStreamer doesn't build on 2020-05 rc1 with
 GObject introspection enabled (wrong path for g-ir-scanner)
In-Reply-To: <bug-12901-163@https.bugs.busybox.net/>
References: <bug-12901-163@https.bugs.busybox.net/>
Message-ID: <bug-12901-163-S20eijcA9m@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12901

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hi,

This is now supposedly fixed with commit b5cd3142963. Care to test again,
please?

Thanks for the report.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
