From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 23:25:25 +0100
Subject: [Buildroot] [PATCH 1/9] package/*/*.mk: Fix indent
In-Reply-To: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141119232525.606502b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 15 Nov 2014 17:29:16 +0100, Maxime Hadjinlian wrote:
> Change LIBFOO_PERMISSIONS everywhere to be a space-separated list.
> As nothing was specified in the manual but all our lists are space
> separated, there is no reason that this one should be made an exception.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Thanks, applied to next. Thanks to Yann for the Ack/Test.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
