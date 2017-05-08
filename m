From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 08 May 2017 07:12:59 +0000
Subject: [Buildroot] [Bug 9436] e2fsprogs remove busybox applets even of
 unselected e2fsprogs components
In-Reply-To: <bug-9436-163@https.bugs.busybox.net/>
References: <bug-9436-163@https.bugs.busybox.net/>
Message-ID: <bug-9436-163-jDjMn7NezC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9436

--- Comment #6 from Joergen Pihlflyckt <Jorgen.Pihlflyckt@ajeco.fi> ---
I agree to this method.

The main problem with the missing utilities (lsattr, chattr) is resolved in
this way, even though it's not the way initially suggested. I thing the matter
of Busybox versus util-linux is much less important that the fact that the
needed utilities _do_ actually get built and installed in the first place.
-----
Jorgen.Pihlflyckt at ajeco.fi

-- 
You are receiving this mail because:
You are on the CC list for the bug.
