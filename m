From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Apr 2020 14:44:08 +0200
Subject: [Buildroot] [PATCH v4] package/python-modbus-tk: new package
In-Reply-To: <1568742691-27792-1-git-send-email-pjtexier@koncepto.io>
References: <1568742691-27792-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20200413144408.34ef6e3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Sep 2019 19:51:31 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

I've applied after bumping to 1.1.0, and doing a small fix to the
license information.

> +PYTHON_MODBUS_TK_LICENSE = LGPL-2.1-or-later

I know what you used is the SPDX standard tag, but in Buildroot, for
historical reasons, we use LGPL-2.1+ and not LGPL-2.1-or-later.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
