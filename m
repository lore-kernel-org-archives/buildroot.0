From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Jun 2021 07:54:02 +0000
Subject: [Buildroot] [Bug 13661] host-python2 build fails on aarch64
In-Reply-To: <bug-13661-163@https.bugs.busybox.net/>
References: <bug-13661-163@https.bugs.busybox.net/>
Message-ID: <bug-13661-163-7JCHx2Ocv8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13661

--- Comment #3 from Torsten Hahn <torstenhahn@fastmail.fm> ---
I experiencing the same issue here:

Host System: docker container running at an Apple M1 machine, git checkout of
recent stable buildroot

(created via docker buildx build --platform linux/arm64 -t br_db/arm64) running
a recent ubuntu image as triggers the described error as soon as host-python2
is built.

Would be very nice to have a workaround / fix for this because we have several
build machines with aarch64 architecture.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
