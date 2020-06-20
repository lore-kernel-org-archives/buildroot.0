From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:55:54 +0200
Subject: [Buildroot] [PATCH v1] package/rtl8821au: add two patches
 fixing compile/runtime for kernels >= 5.3
In-Reply-To: <20200615185911.16490-1-ps.report@gmx.net>
References: <20200615185911.16490-1-ps.report@gmx.net>
Message-ID: <20200620225554.311744f8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jun 2020 20:59:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Add two patches from upstream merge request ([1] to fix compile
> and runtime failures in case of linux kernel >= 5.3.
> 
> [1] https://github.com/abperiasamy/rtl8812AU_8821AU_linux/pull/316
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...-fallthrough-comments-for-kernel-5.3.patch |  28 +++
>  ...river-crashes-from-aircrack-ng-rtl88.patch | 168 ++++++++++++++++++
>  2 files changed, 196 insertions(+)
>  create mode 100644 package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
>  create mode 100644 package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
