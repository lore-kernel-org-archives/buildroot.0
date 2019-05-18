From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:25:26 +0200
Subject: [Buildroot] [PATCH v2 09/13] package/openrc: add patch to
 support busybox version of sysctl
In-Reply-To: <20190512195550.24457-9-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-9-michal.lyszczek@bofc.pl>
Message-ID: <20190518232526.211c20f3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 May 2019 21:55:46 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> Busybox version of sysctl does not support --system argument, and
> files need to be loaded one by one. This patch adds code to sysctl
> service in openrc to recognize busybox sysctl and execute proper
> function based on that.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v1 -> v2
>   None
> ---
>  ...tl.in-add-support-for-busybox-sysctl.patch | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/openrc/0001-init.d-sysctl.in-add-support-for-busybox-sysctl.patch

Applied to next, thanks. Please submit this patch to upstream OpenRC if
not already done. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
