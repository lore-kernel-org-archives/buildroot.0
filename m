From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 14:55:32 +0000
Subject: [Buildroot] [Bug 11341] Compiling qt5base-5.11.1 with libressl
 results in many 'was not declared in this scope' errors
In-Reply-To: <bug-11341-163@https.bugs.busybox.net/>
References: <bug-11341-163@https.bugs.busybox.net/>
Message-ID: <bug-11341-163-PieExvmK4F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11341

--- Comment #4 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Thomas Petazzoni from comment #3)

There seems ongoing work on the freebsd side [1] and updated
suggested patches (did not look at it at details) latest
versions from 2018-10-24/2018-10-25, no news from the qt side...

Would suggest waiting for a settled/accepted freebsd patch before
updating the buildroot port...

[1] https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=228344

-- 
You are receiving this mail because:
You are on the CC list for the bug.
