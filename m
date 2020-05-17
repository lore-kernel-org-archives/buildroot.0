From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 19:27:21 +0000
Subject: [Buildroot] [Bug 12906] qt PrefixPath is wrong on 2020.05-rc1
In-Reply-To: <bug-12906-163@https.bugs.busybox.net/>
References: <bug-12906-163@https.bugs.busybox.net/>
Message-ID: <bug-12906-163-cYlQJi8y9O@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12906

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Joonas, All,

Fixed with Peter's commit:
https://git.buildroot.org/buildroot/commit/?id=6491ca40f8374b310a08ceb904e2a274408739af

Thanks for the report.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
