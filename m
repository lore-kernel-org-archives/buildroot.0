From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Oct 2017 09:56:30 +0200
Subject: [Buildroot] [PATCH] pdbg: needs host dtc
In-Reply-To: <94be5c0c4d4ec6468ff65ba442c2232fd9813a4b.1507529632.git.baruch@tkos.co.il>
References: <94be5c0c4d4ec6468ff65ba442c2232fd9813a4b.1507529632.git.baruch@tkos.co.il>
Message-ID: <20171009095630.2c014826@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Oct 2017 09:13:52 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/722/722e043ef7503abe5fd6517c82b0f12627f4b0f4/
> http://autobuild.buildroot.net/results/891/8918121581f9834fef55169599766a9134600e89/
> http://autobuild.buildroot.net/results/475/475106ec793e16bf8c250d3a69e853537e3e0def/
> 
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/pdbg/pdbg.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
