From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Jun 2021 14:34:25 +0000
Subject: [Buildroot] [Bug 13836] package build failure when target install
 set to no on pkg-generic pkg types
In-Reply-To: <bug-13836-163@https.bugs.busybox.net/>
References: <bug-13836-163@https.bugs.busybox.net/>
Message-ID: <bug-13836-163-8BSAkIrpiN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13836

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Matt, All,

Turned out, that the fix is pretty trivial, but the causes are really not
that simple:

   
https://patchwork.ozlabs.org/project/buildroot/patch/20210613143207.2445691-1-yann.morin.1998 at free.fr/

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
