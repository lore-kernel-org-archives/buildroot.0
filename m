From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Oct 2017 21:20:28 +0000
Subject: [Buildroot] [Bug 10366] dropbear download url has changed
In-Reply-To: <bug-10366-163@https.bugs.busybox.net/>
References: <bug-10366-163@https.bugs.busybox.net/>
Message-ID: <bug-10366-163-GnZ1ZNYBJ1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10366

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
With "access" do you mean visit the website with a web browser? The HSTS header
should cause the browser to rewrite http to https, but it should still work.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
