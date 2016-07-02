From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 18:47:51 +0200
Subject: [Buildroot] [PATCH v3 1/1] sphinxbase: new package
In-Reply-To: <1456904441-28632-1-git-send-email-yba@tkos.co.il>
References: <1456904441-28632-1-git-send-email-yba@tkos.co.il>
Message-ID: <20160702184751.38add1ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Sorry for the long delay in reviewing and applying this patch.

On Wed,  2 Mar 2016 09:40:41 +0200, Jonathan Ben-Avraham wrote:

> +SPHINXBASE_VERSION = 5prealpha
> +SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha
> +SPHINXBASE_LICENSE = MIT

The license really is BSD-2c, so I've fixed that up.

> +# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
> +# 5prealpha tarballs". The license is contained in the copyright notice at the
> +# top of each source file. For example:
> +SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
> +SPHINXBASE_CONF_OPTS = --without-python

I've also added --without-lapack here, just to be sure.

Applied with those two changes. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
