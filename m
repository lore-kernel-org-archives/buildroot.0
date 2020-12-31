From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:43:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: adds target install of
 systemd unit files
In-Reply-To: <20201215163610.12070-1-edmundo.ferreira@esa.int>
References: <20201215163610.12070-1-edmundo.ferreira@esa.int>
Message-ID: <20201231154332.13ef7654@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Dec 2020 17:36:10 +0100
Edmundo Ferreira <fc.edmundo@gmail.com> wrote:

> From: Edmundo Ferreira <fc.edmundo@gmail.com>
> 
> Signed-off-by: Edmundo Ferreira <fc.edmundo@gmail.com>
> ---
>  package/openvpn/openvpn.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Hum, I've applied, but reading again distro/systemd/Makefile.am, it
seems like manually copying those files is not needed. If you pass
--enable-systemd, which we already do when BR2_PACKAGE_SYSTEMD=y. Isn't
that working ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
