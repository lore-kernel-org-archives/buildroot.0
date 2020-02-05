From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:35:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: security bump to
 version 1.45.5
In-Reply-To: <20200205165623.9537-1-titouan.christophe@railnova.eu>
References: <20200205165623.9537-1-titouan.christophe@railnova.eu>
Message-ID: <20200205203510.455f51b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Feb 2020 17:56:23 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This fixes CVE-2019-5188:
> A code execution vulnerability exists in the directory rehashing
> functionality of E2fsprogs e2fsck 1.45.4. A specially crafted ext4
> directory can cause an out-of-bounds write on the stack, resulting
> in code execution. An attacker can corrupt a partition to trigger
> this vulnerability.
> 
> Also change the hash file to the new spacing convention introduced
> by Yann E. Morin.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/e2fsprogs/e2fsprogs.hash | 10 +++++-----
>  package/e2fsprogs/e2fsprogs.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
