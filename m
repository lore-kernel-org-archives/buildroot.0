From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 15:04:41 +0200
Subject: [Buildroot] [PATCH v2,1/2] brltty: add license
In-Reply-To: <20180915104359.24938-1-fontaine.fabrice@gmail.com>
References: <20180915104359.24938-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916150441.7d88dee9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Sep 2018 12:43:58 +0200, Fabrice Fontaine wrote:

> +BRLTTY_LICENSE = GPL-2.0+ with exceptions in LGPL-2.1+

I think it would be better as:

BRLTTY_LICENSE = GPL-2.0+, LGPL-2.1+ (data, client side)

Do you agree ? It doesn't matter a lot for master, because this is
anyway going to be changed to just LGPL-2.1+ by your second patch, but
this first patch adding the license details will probably be backported
to 2018.02.x by Peter.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
