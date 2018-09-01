From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 14:58:53 +0200
Subject: [Buildroot] [PATCH 1/2] python-falcon: add optional dependency
 on host-python-cython
In-Reply-To: <20180830101848.19752-1-grzegorz@blach.pl>
References: <20180830101848.19752-1-grzegorz@blach.pl>
Message-ID: <20180901145853.253fa2ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Aug 2018 12:18:47 +0200, Grzegorz Blach wrote:
> Falcon can be compiled into shared objects using Cython.
> Compiled version works much faster than pure-python one.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-falcon/python-falcon.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
