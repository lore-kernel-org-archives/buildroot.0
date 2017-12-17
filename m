From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 17 Dec 2017 23:00:52 +0100
Subject: [Buildroot] [PATCH 2/2] iproute2: fix configure output file name
In-Reply-To: <8ee7fc92d5c3a7a0b04202d7f4c8043cd32e3724.1513547304.git.baruch@tkos.co.il>
References: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
 <8ee7fc92d5c3a7a0b04202d7f4c8043cd32e3724.1513547304.git.baruch@tkos.co.il>
Message-ID: <20171217220051.GB31927@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> iproute2 renamed the configure script output file to config.mk. Update
> the config tweaking code accordingly.

> The configure script now detects xtables correctly, drop this part.

> Add a comment to explain the TC_CONFIG_XT disable tweak.

> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
Acked-by: Petr Vorel <petr.vorel@gmail.com>
