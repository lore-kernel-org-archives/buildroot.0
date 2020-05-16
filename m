From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 14:29:34 +0000
Subject: [Buildroot] [Bug 12786] Systemd spawns two getty processes when the
 getty port is set to console
In-Reply-To: <bug-12786-163@https.bugs.busybox.net/>
References: <bug-12786-163@https.bugs.busybox.net/>
Message-ID: <bug-12786-163-pftADIJMup@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12786

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I have J?r?my Rosen to have a look, see
http://lists.busybox.net/pipermail/buildroot/2020-May/282962.html. I must say
the logic in systemd.mk is very confusing, and the comment above it doesn't
help understand what's going on.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
