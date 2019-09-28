From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:58:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/xxhash: fix hash of xxhsum.c
In-Reply-To: <20190928064956.25251-1-fontaine.fabrice@gmail.com>
References: <20190928064956.25251-1-fontaine.fabrice@gmail.com>
Message-ID: <20190928215856.0a835dc6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 08:49:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/feb48275dc90f599b5e6d5e09651eaa5a86a5806
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xxhash/xxhash.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
