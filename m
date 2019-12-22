From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Dec 2019 18:28:37 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-XdYZo90G85@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Eric Higgins from comment #6)

Yes, both builds dynamically link to libc, but the unofficial builds probably
statically link to openssl / libuv / zlib / ..

Thanks for the link to their Dockerfile, but I don't seem to find where they
run ./configure?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
