From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:56:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/lzma: add license
In-Reply-To: <20191124180239.32194-1-fontaine.fabrice@gmail.com>
References: <20191124180239.32194-1-fontaine.fabrice@gmail.com>
Message-ID: <20191125215606.7e9a5603@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Nov 2019 19:02:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

>  LZMA_SITE = http://tukaani.org/lzma
> +LZMA_LICENSE = GPL-2.0+, LGPL-2.1+, GPL-3.0+ (tests)

I think should be more specific. It seems like the lzmadec library is
under LGPL-2.1+, while the programs are indeed under GPL-2.0+.

So perhaps it should be:

LGPL-2.1+ (lzmadec library), GPL-2.0+ (programs), GPL-3.0+ (tests)

please double check by looking at the source files of the different
parts of the package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
