From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 May 2014 18:43:27 +0200
Subject: [Buildroot] [PATCH] hwdata: add license information
In-Reply-To: <1400939383-10495-1-git-send-email-abrahamh@web.de>
References: <1400939383-10495-1-git-send-email-abrahamh@web.de>
Message-ID: <20140524184327.7e85ed23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Heiko Abraham,

On Sat, 24 May 2014 15:49:43 +0200, Heiko Abraham wrote:

> +HWDATA_LICENSE = GPLv2 XFree86_1.0_license

This should be:

	GPLv2+ or XFree86-1.0

The LICENSE file is pretty clear that it's one of the two licenses that
should be chosen. And XFree86-1.0 is, according to
http://spdx.org/licenses/, the proper encoding for the XFree86 1.0
License.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
