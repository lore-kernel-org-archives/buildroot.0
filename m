From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 11:57:37 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
In-Reply-To: <1455393768-26580-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455393768-26580-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160224115737.7af50732@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 13 Feb 2016 21:02:48 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/316/3160fb32fbb6990b0bb268524dcea02a1f6880a7/
> http://autobuild.buildroot.net/results/961/9616f09e7cbd020134ba72853acaa28a308432a3//
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: use a better fix (Thomas)
> v2: updated patch to consider improvements suggested by upstream

Instead of this patch, I've committed a patch that simply replaces our
private patch with a NUMACTL_PATCH variable that references the two
upstream commits that fix the numactl build issue for both musl and
uclibc.

Thanks a lot for having worked with upstream on this, definitely
appreciated!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
