From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Nov 2016 19:28:23 +0000
Subject: [Buildroot] [Bug 9451] packatges/postgresql/postgresql.mk contains
 wrong POSTGRESQL_CONF_ENV
In-Reply-To: <bug-9451-163@https.bugs.busybox.net/>
References: <bug-9451-163@https.bugs.busybox.net/>
Message-ID: <bug-9451-163-m2zzpxGLHq@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9451

Peter Seiderer <ps.report@gmx.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Fixed with
https://git.buildroot.net/buildroot/commit/?id=e64ee501a0c8a8700c9a5f0e03e2f6979a0f810d

-- 
You are receiving this mail because:
You are on the CC list for the bug.
