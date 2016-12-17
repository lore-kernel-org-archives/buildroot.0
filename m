From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:21:12 +0100
Subject: [Buildroot] [PATCH] toolchain-external: remove musl-cross
 prebuilt toolchain
In-Reply-To: <1481902185-15500-1-git-send-email-romain.naour@gmail.com>
References: <1481902185-15500-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161217142112.0141d59f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Dec 2016 16:29:45 +0100, Romain Naour wrote:
> The upstream link to download musl-cross prebuilt toolchain is dead [1] and
> there no new download location. Also the last prebuilt toolchain use musl
> 1.1.12 version which is not uptodate (currently 1.1.15).
> 
> Remove this support and recommend to use Buildroot toolchain instead.
> 
> [1] https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in.legacy                                   |  9 +++++++
>  toolchain/toolchain-external/Config.in             |  6 -----
>  .../toolchain-external-musl-cross/Config.in        | 30 ----------------------
>  .../Config.in.options                              | 19 --------------
>  .../toolchain-external-musl-cross.hash             | 12 ---------
>  .../toolchain-external-musl-cross.mk               | 12 ---------
>  6 files changed, 9 insertions(+), 79 deletions(-)
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/Config.in.options
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.hash
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-musl-cross/toolchain-external-musl-cross.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
