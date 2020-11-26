From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 26 Nov 2020 07:26:30 +0000
Subject: [Buildroot] part rootfs size (268435456) too small for >
 rootfs.ext4 (283115520)
In-Reply-To: <mailman.6328.1606344093.178952.buildroot@busybox.net>
References: <mailman.6328.1606344093.178952.buildroot@busybox.net>
Message-ID: <cb0d584e463fa4296191b6742246bd4d@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kevin,

>   *   exact file size superior or equal to 265 I got : part rootfs
> size (268435456) too small for rootfs.ext4 (283115520)

Check if you have a directive in your genimage.cfg file that limits the 
partition size to 256M.

Regards,
Andreas
