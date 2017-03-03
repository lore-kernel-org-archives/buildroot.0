From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Mar 2017 22:10:58 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-mN0tkl3EMm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #28 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Paul Stewart from comment #27)

Thanks a lot for all the testing you did! :-)

This is really weird that your shell does have checkwinsize on. It
should be off by default in a non-interactive shell, and shell script
are running in non-interactive shells...

Anyway... I just sent the patch:

    http://lists.busybox.net/pipermail/buildroot/2017-March/185755.html

Thanks again!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
