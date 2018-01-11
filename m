From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Jan 2018 17:17:45 +0000
Subject: [Buildroot] [Bug 10136] can't compile systemd with GCC 7.X when
 optimization is on
In-Reply-To: <bug-10136-163@https.bugs.busybox.net/>
References: <bug-10136-163@https.bugs.busybox.net/>
Message-ID: <bug-10136-163-UzX9zFwiZ3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10136

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Thomas Petazzoni from comment #4)
> we already have a patch in patchwork updating it to version 236.
> Once this patch gets merged, this bug will be fixed.

We must also apply https://patchwork.ozlabs.org/patch/856392/
first, otherwise the gitlab-ci infra will not be able to run
the runtime tests.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
