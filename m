From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 23:00:23 +0200
Subject: [Buildroot] [PATCH v4 06/10] package/python-mwscrape: new
 package
In-Reply-To: <20161009124625.23303-6-bernd.kuhls@t-online.de>
References: <20161009124625.23303-1-bernd.kuhls@t-online.de>
 <20161009124625.23303-6-bernd.kuhls@t-online.de>
Message-ID: <20161009230023.5708ec22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Oct 2016 14:46:21 +0200, Bernd Kuhls wrote:

> +PYTHON_MWSCRAPE_VERSION = 6a58d7801eb1e884fd0516f1adbedbd4481c10e6
> +PYTHON_MWSCRAPE_SITE = $(call github,itkach,mwscrape,$(PYTHON_MWSCRAPE_VERSION))
> +PYTHON_MWSCRAPE_LICENSE = BSD-3c
> +PYTHON_MWSCRAPE_LICENSE_FILES = LICENSE.txt

Not sure where you got this BSD-3c thing. The LICENSE.txt file contains
the text of the Mozilla Public License 2.0, so I've changed the license
value to MPL-2.0.

Applied with this fixed, but please try to be careful with the
licensing information. If you're not sure, just ask advise from others
(it's sometimes really difficult to understand the license of some
software packages).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
