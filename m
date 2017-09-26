From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Sep 2017 16:19:02 +0000
Subject: [Buildroot] [Bug 10326] mesa3d package fails to build when
 BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <bug-10326-163@https.bugs.busybox.net/>
References: <bug-10326-163@https.bugs.busybox.net/>
Message-ID: <bug-10326-163-g7Vv4WmnlR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10326

--- Comment #3 from Bernd Kuhls <bernd.kuhls@t-online.de> ---
(In reply to Frederic MATHIEU from comment #2)

Why?

BR2_SHARED_STATIC_LIBS=y means 
https://git.buildroot.net/buildroot/tree/Config.in#n655
"Build both shared and static libraries".

Mesa3d does not support this combination:
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.2#n490

-- 
You are receiving this mail because:
You are on the CC list for the bug.
