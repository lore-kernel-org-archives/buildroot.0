From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 16:34:01 +0200
Subject: [Buildroot] [PATCH 2/2] gupnp-tools: new package
In-Reply-To: <1469778689-31893-2-git-send-email-fabrice.fontaine@orange.com>
References: <1469778689-31893-1-git-send-email-fabrice.fontaine@orange.com>
 <1469778689-31893-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160730163401.25d59138@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Jul 2016 09:51:29 +0200, Fabrice Fontaine wrote:
> GUPnP Tools are free replacements of Intel UPnP tools that use
> GUPnP. They provides client and server side tools which enable
> one to easily test and debug one's UPnP devices and control
> points.
> 
> http://www.gupnp.org/
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
>  package/Config.in                    |  1 +
>  package/gupnp-tools/Config.in        | 34 ++++++++++++++++++++++++++++++++++
>  package/gupnp-tools/gupnp-tools.hash |  2 ++
>  package/gupnp-tools/gupnp-tools.mk   | 35 +++++++++++++++++++++++++++++++++++
>  4 files changed, 72 insertions(+)
>  create mode 100644 package/gupnp-tools/Config.in
>  create mode 100644 package/gupnp-tools/gupnp-tools.hash
>  create mode 100644 package/gupnp-tools/gupnp-tools.mk

I've applied, after doing the following changes:

    [Thomas:
     - use "depends on BR2_PACKAGE_LIBGTK3" instead of a select, and
       simplify the Config.in comments consequently.
     - move from "Development tools" to "Networking applications"
     - license is GPLv2+, not LGPLv2+.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
