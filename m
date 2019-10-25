From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:19:57 +0200
Subject: [Buildroot] [PATCH] package/qemu: enable NUMA support if
 numactl is selected
In-Reply-To: <20191022224739.4823-1-unixmania@gmail.com>
References: <20191022224739.4823-1-unixmania@gmail.com>
Message-ID: <20191025201957.0b385e82@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 19:47:39 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> This is helpful for the upcoming libvirt package.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/qemu/qemu.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
