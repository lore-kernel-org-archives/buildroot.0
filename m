From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 13:56:20 +0100
Subject: [Buildroot] [PATCH] Makefile: clarify comment on .br-external
 handling
In-Reply-To: <b036dd78f478b15f5e0c74ebe01915ec43cca382.1419485788.git.baruch@tkos.co.il>
References: <b036dd78f478b15f5e0c74ebe01915ec43cca382.1419485788.git.baruch@tkos.co.il>
Message-ID: <20141226135620.55674108@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 25 Dec 2014 07:36:28 +0200, Baruch Siach wrote:
> The comment language may lead the reader to think that .br-external is removed
> whenever BR2_EXTERNAL is not set in the command line. Make it clear that
> BR2_EXTERNAL must be explicitly set to an empty value for .br-external to get
> removed.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
