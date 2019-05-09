From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 22:30:06 +0200
Subject: [Buildroot] [PATCH v3,1/4] package/bind: enable static build
In-Reply-To: <20190426165613.31812-1-fontaine.fabrice@gmail.com>
References: <20190426165613.31812-1-fontaine.fabrice@gmail.com>
Message-ID: <20190509223006.2b8fc6f2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 26 Apr 2019 18:56:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Static build has been disabled in 2014 with commit
> 6045904752b06a8b8e52ba8fc2e49a8548964e8d however bind can be built
> statically thanks to --without-dlopen so enable it back
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Move bind9-config under BR2_STATIC_LIBS condition
>  - Drop DHCP_MAKE and DHCP_MAKE_ENV as these variables were set for the
>    embedded bind

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
