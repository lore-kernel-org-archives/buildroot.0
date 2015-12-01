From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 23:05:51 +0100
Subject: [Buildroot] [PATCH v1 1/3] aufs-standalone: new package
In-Reply-To: <1438387017-10597-1-git-send-email-christian@paral.in>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
Message-ID: <20151201230551.7eabb769@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

On Fri, 31 Jul 2015 16:56:55 -0700, Christian Stewart wrote:
> aufs-standalone is a metapackage that downloads the correct
> aufs-standalone sources for patching the kernel with the aufs
> filesystem. The package is not selectable because it does nothing but
> download the sources on default. It is a dependency of the Aufs kernel
> extension.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Your patches are 4 months old, and you got a lot of review comments.
Could you address them and resend an updated version, if you are still
interested in getting aufs support merged in Buildroot ?

In the mean time, I'll mark your patches as Changes Requested in
patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
