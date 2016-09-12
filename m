From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:36:09 +0200
Subject: [Buildroot] [PATCH 1/1] syslinux: add patch to disable pie
In-Reply-To: <20160912010426.16874-1-bluemrp9@gmail.com>
References: <20160912010426.16874-1-bluemrp9@gmail.com>
Message-ID: <20160912223609.2847b0cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 18:04:26 -0700, Ryan Coe wrote:
> Ubuntu 16.10 has pie enable by default. This causes a build failure with
> syslinux.
> 
> https://bugs.launchpad.net/ubuntu/+source/syslinux/+bug/1579023
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  boot/syslinux/0002-disable-pie.patch | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 boot/syslinux/0002-disable-pie.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
