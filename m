From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Sep 2019 13:30:37 +0000
Subject: [Buildroot] [Bug 12196] duma package
In-Reply-To: <bug-12196-163@https.bugs.busybox.net/>
References: <bug-12196-163@https.bugs.busybox.net/>
Message-ID: <bug-12196-163-Sx1epyvgz0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12196

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
THanks for your bug report. However, the real question is why is duma failing
in -O2 ? Rather than forcing -O0, it seems much more relevant to understand why
it does not work when compiled in -O2.

Could you get a core dump, and see on which instruction it crashes ? Which ARM
processor are you using ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
