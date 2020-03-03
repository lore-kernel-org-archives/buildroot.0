From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 03 Mar 2020 21:38:25 +0000
Subject: [Buildroot] [Bug 12596] host-e2fsprogs: tune2fs incompatibility on
 older glibc version
In-Reply-To: <bug-12596-163@https.bugs.busybox.net/>
References: <bug-12596-163@https.bugs.busybox.net/>
Message-ID: <bug-12596-163-JxSfrmKeDO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12596

--- Comment #3 from romain.naour at gmail.com ---
(In reply to Ryan Barnett from comment #2)
Hi Ryan,

I would recommend to build your SDK from ubuntu 16.04 and deploy it to ubuntu
18.04 or later. It's far easier than building a host native toolchain ;)

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
