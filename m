From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:37:36 +0100
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: add automatic selinux
 config selection
In-Reply-To: <20200312180909.2948885-1-aduskett@gmail.com>
References: <20200312180909.2948885-1-aduskett@gmail.com>
Message-ID: <20200314153736.09c2458e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 11:09:08 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Enabling SELinux support in the kernel requires several options, many of which
> are in different areas. These options are as follows:
> 
>   - CONFIG_AUDIT
>   - CONFIG_DEFAULT_SECURITY_SELINUX
>   - CONFIG_INET
>   - CONFIG_NET
>   - CONFIG_SECURITY
>   - CONFIG_SECURITY_NETWORK
>   - CONFIG_SECURITY_SELINUX
> 
> As such, if a user selects the libselinux package, it is much easier to select
> these packages for them, much like we already do with other packages
> such as systemd or iptables.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  linux/linux.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
