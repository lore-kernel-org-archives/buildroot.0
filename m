From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:58:18 +0100
Subject: [Buildroot] [PATCH] lldpd: Update to version 1.0.1
In-Reply-To: <20181122003531.2868-1-tpiepho@impinj.com>
References: <20181122003531.2868-1-tpiepho@impinj.com>
Message-ID: <20181123215818.2b5def1a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 00:35:44 +0000, Trent Piepho wrote:
> Drop patches for atom glue and remove CXX compiler check as they are
> applied upstream.
> 
> Replace patch to disable libbsd with upstream patch to accomplish the
> same thing using --without-libbsd.
> 
> Enable support for readline when that package is enabled.
> 
> Enable lldpd's systemd unit file.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  ...ity-to-disable-libbsd-with-without-libbsd.patch | 104 +++++++++++++++++++++
>  ...generation-of-atom-glue-compatible-with-o.patch |  43 ---------
>  .../0002-configure-do-not-check-for-libbsd.patch   |  61 ------------
>  ...03-configure-remove-check-on-CXX-compiler.patch |  35 -------
>  package/lldpd/lldpd.hash                           |   2 +-
>  package/lldpd/lldpd.mk                             |  11 ++-
>  6 files changed, 114 insertions(+), 142 deletions(-)
>  create mode 100644 package/lldpd/0001-build-ability-to-disable-libbsd-with-without-libbsd.patch
>  delete mode 100644 package/lldpd/0001-build-make-generation-of-atom-glue-compatible-with-o.patch
>  delete mode 100644 package/lldpd/0002-configure-do-not-check-for-libbsd.patch
>  delete mode 100644 package/lldpd/0003-configure-remove-check-on-CXX-compiler.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
