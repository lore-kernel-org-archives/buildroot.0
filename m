From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jul 2017 16:25:19 +0000
Subject: [Buildroot] [Bug 10136] can't compile systemd with GCC 7.X when
 optimization is on
In-Reply-To: <bug-10136-163@https.bugs.busybox.net/>
References: <bug-10136-163@https.bugs.busybox.net/>
Message-ID: <bug-10136-163-Oz4TlKeAYx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10136

--- Comment #2 from Andrey Yurovsky <yurovsky@gmail.com> ---
I'm having trouble tracking it down. From the systemd bug tracker discussion it
looks like "7.1.1" addresses this but there's no such release. The Fedora
package they mention is assumed to have the fix but I can't find anything in
the changelog or referenced bug IDs that seems relevant. I'll keep searching.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
