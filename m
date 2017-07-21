From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Jul 2017 12:19:01 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-RzMy1wdJ2A@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #14 from Ivan <ivan.nazarenko@gmail.com> ---
> BTW Ivan please clone this bug for the Qt5base issue, it has nothing to do with
> graphite support.

Reported it to the gcc people:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81497

Though I did not understand their comment. I would fix it simply type casting
the third parameter. But in this case I am sure I do not know what I am talking
about.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
