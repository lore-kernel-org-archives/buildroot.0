From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Mar 2021 09:04:29 +0000
Subject: [Buildroot] [Bug 13576] Issues compiling buildroot for 5x86
In-Reply-To: <bug-13576-163@https.bugs.busybox.net/>
References: <bug-13576-163@https.bugs.busybox.net/>
Message-ID: <bug-13576-163-so4YckFbil@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13576

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Sorry to hear of your issues. You will need to provide more details for us to
help though, E.G. what is your Buildroot configuration and what are the exact
error messages?

We indeed don't have a lilo package, but feel free to submit one if you are
willing to maintain it. Given how old it is, I could imagine that newer
toolchain versions could cause breakage.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
