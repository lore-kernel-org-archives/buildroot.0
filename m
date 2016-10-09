From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 23:11:47 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/python-mwscrape2slob: new
 package
In-Reply-To: <20161009143144.10947-1-bernd.kuhls@t-online.de>
References: <20161009143144.10947-1-bernd.kuhls@t-online.de>
Message-ID: <20161009231147.532f3b60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Oct 2016 16:31:44 +0200, Bernd Kuhls wrote:

> +PYTHON_MWSCRAPE2SLOB_VERSION = 0f9124ed62009dff6a230947d80340f5a61a6f49
> +PYTHON_MWSCRAPE2SLOB_SITE = $(call github,itkach,mwscrape2slob,$(PYTHON_MWSCRAPE2SLOB_VERSION))
> +PYTHON_MWSCRAPE2SLOB_LICENSE = GPLv3, Apache-2.0 (MathJax), \
> +	GPL (MediaWiki monobook style sheet)

Having this on two lines is not good, it will mess up the legal-info
generation I believe, so I've changed this to just one line, and
applied your patch.

The "GPL" with no version with the style sheet is unfortunate, but it's
indeed the only information available in the code.

Could you get in touch with upstream to ask them to add some more
precise license information, as well as a file containing the
different license texts?

Finally, since I've now applied all your pending python packages, could
you send a patch updating the DEVELOPERS file to reference you as a
developer following those packages?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
