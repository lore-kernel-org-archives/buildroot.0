From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Sep 2017 11:27:52 +0000
Subject: [Buildroot] [Bug 10351] glibc missing in rootfs
In-Reply-To: <bug-10351-163@https.bugs.busybox.net/>
References: <bug-10351-163@https.bugs.busybox.net/>
Message-ID: <bug-10351-163-UuQWCaiHqO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10351

--- Comment #3 from alex.theissen at me.com ---
I was building it in a fresh docker container every time.

But you are right. When I did a clean build the problem is gone. 

I just replaced "make" with "make clean all"

Thanks for your effords!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
