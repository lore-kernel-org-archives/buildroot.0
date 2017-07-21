From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 15:55:28 +0200
Subject: [Buildroot] [PATCH] package/openal: bump version to 1.18.0
In-Reply-To: <1500644031-25581-1-git-send-email-nerv@dawncrow.de>
References: <1500644031-25581-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20170721155528.018481e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 15:33:51 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  .../0001-Build-NEON-code-with-mfpu-neon.patch      | 29 ----------
>  ...heck-for-run-time-NEON-support-by-reading.patch | 67 ----------------------
>  ...003-Properly-check-if-proc-cpuinfo-opened.patch | 24 --------
>  ...k-if-mfpu-neon-is-available-for-compiling.patch | 47 ---------------
>  .../openal/0005-Fix-detection-of-C11-atomics.patch | 53 -----------------

When you drop patches, it's nice to have a slightly more descriptive
commit log that says why those patches are dropped. For some of them,
it's quite obvious, since they were backports from upstream commits
(0001, 0002, 0003 and 0004), but for some others, it's not really
obvious (patch 0005).

Is the patch 0005 now upstream and part of 1.18.0 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
