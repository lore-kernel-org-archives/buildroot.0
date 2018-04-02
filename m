From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 22:23:57 +0200
Subject: [Buildroot] [git commit] lxc: bump to version 3.0.0
In-Reply-To: <20180402085924.CBD128393F@busybox.osuosl.org>
References: <20180402085924.CBD128393F@busybox.osuosl.org>
Message-ID: <20180402222357.7188b46f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 2 Apr 2018 10:13:14 +0200, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=af26608c65cfbc544787ff86c666e2af064844a1
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> - Remove both patches (applied upstream), and therefore remove
>   AUTORECONF = YES.
> - Remove --disable-python as python support has been removed
>  (https://github.com/lxc/lxc/commit/e144a06bd792f99c96395a9d4c16cf7c656fb99d)
> - Remove lua optional dependency as lua support has been removed
>  (https://github.com/lxc/lxc/commit/b52a5bef6fa56481a6d817f4c73cb91ed012fe2c)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This update causes some build failures:
http://autobuild.buildroot.net/?reason=lxc-3.0.0

Could you have a look ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
