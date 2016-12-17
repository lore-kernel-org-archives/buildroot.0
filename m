From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:18:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 Explicitly disable glamor support when dependencies are not met
In-Reply-To: <20161217063448.964-1-bernd.kuhls@t-online.de>
References: <20161217063448.964-1-bernd.kuhls@t-online.de>
Message-ID: <20161217141835.4c2ce52f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Dec 2016 07:34:48 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/b48/b48074089da770463f7ffcc27e385ac59456edc5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
