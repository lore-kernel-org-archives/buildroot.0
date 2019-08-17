From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 00:20:06 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: also dump args it was
 called with
In-Reply-To: <20190817124817.8859-1-yann.morin.1998@free.fr>
References: <20190817124817.8859-1-yann.morin.1998@free.fr>
Message-ID: <20190818002006.30249849@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 17 Aug 2019 14:48:17 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  toolchain/toolchain-wrapper.c | 49 +++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 20 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
