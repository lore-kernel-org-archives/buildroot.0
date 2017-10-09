From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 Oct 2017 16:25:09 +0930
Subject: [Buildroot] [PATCH] pdbg: needs host dtc
In-Reply-To: <94be5c0c4d4ec6468ff65ba442c2232fd9813a4b.1507529632.git.baruch@tkos.co.il>
References: <94be5c0c4d4ec6468ff65ba442c2232fd9813a4b.1507529632.git.baruch@tkos.co.il>
Message-ID: <CACPK8XfX8cyyjFY4TaNdfZFffccFnCS2gp7xeguv-zF64r72ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 9, 2017 at 3:43 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Fixes:
> http://autobuild.buildroot.net/results/722/722e043ef7503abe5fd6517c82b0f12627f4b0f4/
> http://autobuild.buildroot.net/results/891/8918121581f9834fef55169599766a9134600e89/
> http://autobuild.buildroot.net/results/475/475106ec793e16bf8c250d3a69e853537e3e0def/
>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks for the patch. I gave it a spin on my machine (without dtc
installed) and it looks good.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
