From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:37:52 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tools: license is 3c BSD,
 not 2c
In-Reply-To: <20190408192258.12121-1-peter@korsgaard.com>
References: <20190408192258.12121-1-peter@korsgaard.com>
Message-ID: <20190408223752.368db156@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 21:22:57 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> The license contains the "no endorsement" clause, so it should be listed as
> BSD-3-Clause:
> 
>   * Neither the name of Intel Corporation nor the names of its contributors
>     may be used to endorse or promote products derived from this software
>     without specific prior written permission.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/tpm2-tools/tpm2-tools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
