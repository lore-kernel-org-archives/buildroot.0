From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 19:33:56 +0000
Subject: [Buildroot] [Bug 11071] Building postgresql package on Debian 9.4
 x64 for armel target fails
In-Reply-To: <bug-11071-163@https.bugs.busybox.net/>
References: <bug-11071-163@https.bugs.busybox.net/>
Message-ID: <bug-11071-163-kCkhP3cDwR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11071

--- Comment #9 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to dde from comment #6)
Thanks for the patch, looks good, the only missing thing
is the dependency on libxml2, e.g.:

POSTGRESQL_DEPENDENCIES += libxml2

Regards,
Peter

-- 
You are receiving this mail because:
You are on the CC list for the bug.
