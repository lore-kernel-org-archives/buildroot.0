From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:49:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/vboot-utils: fix -fno-common
 build failure
In-Reply-To: <20200519065322.16403-1-heiko.thiery@gmail.com>
References: <20200519065322.16403-1-heiko.thiery@gmail.com>
Message-ID: <20200521154936.147c89e4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 May 2020 08:53:21 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Added upstream patch for fixing build failure when using GCC10 as a host
> compiler (-fno-common is now default).
> 
> Fixes:
> http://autobuild.buildroot.net/results/aca662d9fd7052f3b361b731cd266edb3b6c41b0
> http://autobuild.buildroot.net/results/6546b284cf306a2fde3c69d67daf9aacffa9e143
> http://autobuild.buildroot.net/results/db20bb3c11a1a9558a5d8021015c6915f99097c8
> 
> Cc: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...-Make-vboot_version-extern-in-header.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/vboot-utils/0007-Make-vboot_version-extern-in-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
