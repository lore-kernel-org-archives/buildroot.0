From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 20:33:06 +0100
Subject: [Buildroot] [PATCH] package/xen: Fix COPYING sha256sum
In-Reply-To: <20200205173317.20745-1-alistair.francis@wdc.com>
References: <20200205173317.20745-1-alistair.francis@wdc.com>
Message-ID: <20200205203306.5148e29f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  5 Feb 2020 09:33:17 -0800
Alistair Francis <alistair.francis@wdc.com> wrote:

> The COPYING file was updated between 4.12 and 4.13 as a new paragraph
> about the Sphinx documentation being licensed under CC-BY 4.0 was added.
> Update the SHA to match the new license.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  package/xen/xen.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
