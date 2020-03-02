From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Mar 2020 21:54:47 +0000
Subject: [Buildroot] [Bug 12596] host-e2fsprogs: tune2fs incompatibility on
 older glibc version
In-Reply-To: <bug-12596-163@https.bugs.busybox.net/>
References: <bug-12596-163@https.bugs.busybox.net/>
Message-ID: <bug-12596-163-XgCFTDMxqC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12596

--- Comment #2 from Ryan Barnett <ryan.barnett@rockwellcollins.com> ---
Hi Romain,

Thank you for the prompt reply.

Based on what you said, in order to solve the problem buildroot would need to
support specify a custom "host" toolchain which would be used to compile all of
the host binaries?

I'd imagine that would be outside of the scope of what buildroot is designed to
do. 

Thanks,
-Ryan

-- 
You are receiving this mail because:
You are on the CC list for the bug.
