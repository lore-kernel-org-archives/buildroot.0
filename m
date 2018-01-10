From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 20:20:44 +0000
Subject: [Buildroot] [Bug 10551] PowerPC SPE and Musl
In-Reply-To: <bug-10551-163@https.bugs.busybox.net/>
References: <bug-10551-163@https.bugs.busybox.net/>
Message-ID: <bug-10551-163-e2HJQeiBk5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10551

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your suggestion. Indeed what you say seems to match the details at
https://wiki.musl-libc.org/faq.html#Q:-My-dynamically-linked-program-crashes-on-PowerPC!.

There is one thing that is unclear to me: is this --with-long-double-{64,128}
option only needed for PowerPC SPE, or for PowerPC in general ? What about
--enable-secureplt ? Is it only for PowerPC SPE, or for PowerPC in general ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
