From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:29:07 +0200
Subject: [Buildroot] [PATCH 3/8 v11] package/xserver_xorg-server: add
 blind options to specify driver ABI
In-Reply-To: <f1bf83e904fb4296ae09c6e56b5725e07d448ef6.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
 <f1bf83e904fb4296ae09c6e56b5725e07d448ef6.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <20150426222907.59b83624@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 21 Apr 2015 19:04:39 +0200, Yann E. MORIN wrote:
> The upcoming NVidia Tegra2/3 binary blobs only work with a certain
> VIDEODRV ABI (namely up to 14), so we must have a way to represent that
> ABI so that such packages can not be enabled with a too recent/old ABI.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xserver_xorg-server/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
