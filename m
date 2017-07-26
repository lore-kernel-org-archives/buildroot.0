From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jul 2017 16:08:47 +0000
Subject: [Buildroot] [Bug 10136] can't compile systemd with GCC 7.X when
 optimization is on
In-Reply-To: <bug-10136-163@https.bugs.busybox.net/>
References: <bug-10136-163@https.bugs.busybox.net/>
Message-ID: <bug-10136-163-wpPenTcTPe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10136

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the report!

Can you figure out the corresponding gcc PR, and therefore the gcc commit that
fixes this ?

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
