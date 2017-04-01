From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:44:49 +0200
Subject: [Buildroot] [PATCH] libiio: Don't force specific backends when
 enabling tests
In-Reply-To: <20170331152353.30717-1-paul.cercueil@analog.com>
References: <20170331152353.30717-1-paul.cercueil@analog.com>
Message-ID: <20170401144449.73119655@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 17:23:53 +0200, Paul Cercueil wrote:
> The test programs will compile just fine even when none of the backends
> are enabled.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  package/libiio/Config.in | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
