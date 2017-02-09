From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:40:44 +0100
Subject: [Buildroot] [PATCH 7/7] ddrescue: fix target build
In-Reply-To: <99cad486180867002ec348364cf9ac9028b74d0e.1486669818.git.baruch@tkos.co.il>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
 <99cad486180867002ec348364cf9ac9028b74d0e.1486669818.git.baruch@tkos.co.il>
Message-ID: <20170209214044.6aacb66e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 21:50:18 +0200, Baruch Siach wrote:
> ddrescue is not an autotools package. Covert to generic package to make it
> build correctly for target architecture.
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ddrescue/ddrescue.mk | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

It's really weird to have this mixed with a patch series related to
improving lzip support. I know ddrescue is using lzip, but this patch
is really unrelated from lzip support. It would be better to send such
patches separately.

Nevertheless, this was very useful, so I've applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
