From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 14:23:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xapp_sessreg: fix musl
 build
In-Reply-To: <20161218123941.22369-1-bernd.kuhls@t-online.de>
References: <20161218123941.22369-1-bernd.kuhls@t-online.de>
Message-ID: <20161218142359.245e946b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 13:39:41 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/717/717bd4a2ee4ba62ed9245ec22166a3c63ce1a56d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: upstream patch was updated for musl-1.1.14
>     https://github.com/gentoo/musl/commit/bcccf08b2d3d202e4b957d05aab847f1c725de68

Applied to master, thanks. Please submit the patch upstream.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
