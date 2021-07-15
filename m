From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:45:08 +0200
Subject: [Buildroot] [PATCH] package/sbc: bump to version 1.5
In-Reply-To: <20210711121929.24767-1-texier.pj2@gmail.com>
References: <20210711121929.24767-1-texier.pj2@gmail.com>
Message-ID: <20210715214508.5350f202@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 11 Jul 2021 14:19:29 +0200
Pierre-Jean Texier <texier.pj2@gmail.com> wrote:

> We need to backport a commit to fix a build failure on non-x86.
> 
> Also update hash file formatting (2 spaces)
> 
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
> ---
>  ...-sbc_primitives-Fix-build-on-non-x86.patch | 49 +++++++++++++++++++
>  package/sbc/sbc.hash                          |  6 +--
>  package/sbc/sbc.mk                            |  2 +-
>  3 files changed, 53 insertions(+), 4 deletions(-)
>  create mode 100644 package/sbc/0001-sbc_primitives-Fix-build-on-non-x86.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
