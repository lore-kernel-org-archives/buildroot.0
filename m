From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2015 16:49:31 +0000
Subject: [Buildroot] [Bug 8541] fail to build host-fakeroot-1.20.2
In-Reply-To: <bug-8541-163@https.bugs.busybox.net/>
References: <bug-8541-163@https.bugs.busybox.net/>
Message-ID: <bug-8541-163-Er34JR2Apy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8541

--- Comment #2 from Vicente Olivert Riera <vincent.riera@imgtec.com> ---
It can be also related to this:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=758406

In that case it can be fixed updating your Debian distro, specially the
libc6-dev and linux-libc-dev packages, or by adding this patch to the fakeroot
package in Buildroot:

https://sources.debian.net/patches/patch/fakeroot/1.20.2-1/glibc-xattr-types/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
