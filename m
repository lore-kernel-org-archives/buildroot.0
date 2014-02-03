From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Feb 2014 22:52:37 +0100
Subject: [Buildroot] [PATCH 2/2] mysql: disable debugging option
In-Reply-To: <52efff31.0902ec0a.7f04.45f7@mx.google.com>
References: <52efff31.0902ec0a.7f04.45f7@mx.google.com>
Message-ID: <20140203225237.6c503ed7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Feb 2014 17:51:19 +0000, kuyurix at gmail.com wrote:
> From: Marcelo Guti?rrez <kuyurix@gmail.com>
> 
> it is not necessary to use $(ENABLE_DEBUG) with "--without-server" option.

Can you expand on this a little bit?

> BTW, the value of "ENABLE_DEBUG" is empty.

No, not necessarily. ENABLE_DEBUG is a global variable that contains
--enable-debug if BR2_ENABLE_DEBUG is enabled, or is empty otherwise.
See: http://git.buildroot.net/buildroot/tree/package/Makefile.in#n357.

Also, I'm not sure to understand why this patch is PATCH 2/2. I don't
think I have received a PATCH 1/2 in this series. Is this expected?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
