From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 09:42:20 +0100
Subject: [Buildroot] [PATCH] Makefile: ignore .config for defconfig
In-Reply-To: <1388099069-10529-1-git-send-email-yann.morin.1998@free.fr>
References: <1388099069-10529-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131227094220.66c2bfa3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 27 Dec 2013 00:04:29 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, we do not include .config for all '%_defconfig' targets, but
> we forgot to also exclude plain 'defconfig'.
> 
> Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
