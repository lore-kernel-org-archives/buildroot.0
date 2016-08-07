From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:52:55 +0200
Subject: [Buildroot] [RFC] package/bdwgc: fix pthread detection on
 uclinux platforms
In-Reply-To: <1470519997-8445-1-git-send-email-romain.naour@gmail.com>
References: <1470519997-8445-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160807235255.29f7acb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 23:46:37 +0200, Romain Naour wrote:
> bdwgc does not recognize "uclinux" as a valid OS part of the target
> tuple which is used by some arm cortex-M toolchains.
> 
> Fixes:
> http://autobuild.buildroot.net/results/94f/94fbc1e5afe183e5b071d1e869b2d780025389e2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> Warning: build tested only.
> ---
>  .../0004-configure-match-uclinux-pattern.patch     | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/bdwgc/0004-configure-match-uclinux-pattern.patch

Applied to master, thanks. Please submit the patch upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
