From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Feb 2014 09:45:37 +0100
Subject: [Buildroot] [PATCH] libroxml: bump version to 2.3.0
In-Reply-To: <1391189802-5284-1-git-send-email-blunderer@blunderer.org>
References: <1391189802-5284-1-git-send-email-blunderer@blunderer.org>
Message-ID: <20140201094537.69fb978d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Jan 2014 09:36:42 -0800, blunderer at blunderer.org wrote:

> -LIBROXML_VERSION = 2.2.3
> +LIBROXML_VERSION = 2.3.0
>  LIBROXML_SITE = http://download.libroxml.net/pool/v2.x/
>  LIBROXML_INSTALL_STAGING = YES
> +LIBROXML_LICENSE = LGPLv2.1+

Maybe we want to indicate the static linking exception, something like:

LIBROXML_LICENSE = LGPLv2.1+ with static link exception

Maybe you also want to disable the build of the documentation and the
tests? I see that there are configuration options available for these
in your configure.ac.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
