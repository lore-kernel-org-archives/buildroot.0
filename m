From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 21:54:42 +0200
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
In-Reply-To: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140622215442.4c060328@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Jun 2014 11:39:22 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in       |  1 +
>  package/geoip/Config.in | 11 +++++++++++
>  package/geoip/geoip.mk  | 15 +++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/geoip/Config.in
>  create mode 100644 package/geoip/geoip.mk

Thanks, applied. One comment below.

> +	  GeoIP is a C library that enables the user to find geographical
> +	  and network information of an IP address.
> +	  To use this library, you need to download MaxMind's free GeoLite or
> +	  commercial GeoIP binary databases into the target's /usr/share/GeoIP
> +	  directory in uncompressed form.

Wouldn't it make sense to create a package for the free database, so
that GeoIP can be useful out of the box?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
