From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2019 23:25:18 +0200
Subject: [Buildroot] [PATCH] package/linux-headers: fix uclibc-ng build
 for xtensa
In-Reply-To: <20190930072756.17420-1-jcmvbkbc@gmail.com>
References: <20190930072756.17420-1-jcmvbkbc@gmail.com>
Message-ID: <be839e5a-38f3-438c-cffe-d0bb07693149@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/09/2019 09:27, Max Filippov wrote:
> Definition of struct clone_args made header include/uapi/linux/sched.h
> unusable for inclusion from assembly, breaking xtensa and riscv64
> uclibc-ng builds. Backport proposed fix.

 This proposed fix has been included in 5.3.6 which is now our default version.
So I assume this patch is no longer needed. I've marked it as Superseded (by the
kernel version bump).

 Regards,
 Arnout

> 
> Fixes:
> http://autobuild.buildroot.net/results/336ba3d9f44fdded48bc71a51e8620418793770b
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
[snip]
