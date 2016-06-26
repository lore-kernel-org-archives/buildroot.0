From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 23:08:43 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: add fuse2fs libintl fix patch
In-Reply-To: <1466640574-12773-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466640574-12773-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160626230843.288df5bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:09:34 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/ab5/ab5c5b0e234f3d9db78c968334a61a7aef206b7a/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/e2fsprogs/0003-fuse2fs-needs-SYSLIBS.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
