From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:19:23 +0100
Subject: [Buildroot] [PATCH 1/5] package/binutils: switch to use 2.31.x
 as the default version
In-Reply-To: <20190312230839.23307-1-romain.naour@gmail.com>
References: <20190312230839.23307-1-romain.naour@gmail.com>
Message-ID: <20190314221923.6d361b69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Mar 2019 00:08:35 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Now that binutils 2.32 has been released, it is time to move to
> binutils 2.31.x as the default binutils version, instead of 2.29.1.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/binutils/Config.in.host | 2 +-
>  package/binutils/binutils.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied. Once again, many thanks for all this work to keep our
toolchain components up-to-date.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
