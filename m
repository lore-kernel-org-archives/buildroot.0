From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 22:32:53 +0200
Subject: [Buildroot] [PATCH 1/1] boost: enable back log on powerpc with
 uclibc
In-Reply-To: <20180818201052.3959-1-fontaine.fabrice@gmail.com>
References: <20180818201052.3959-1-fontaine.fabrice@gmail.com>
Message-ID: <20180818223253.6df6bdfe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Aug 2018 22:10:52 +0200, Fabrice Fontaine wrote:
> boost-log builds fine with powerpc on uclibc nowadays so enable it back.
> By removing this dependency, build failure on azmq is also fixed as this
> package is currently selecting boost-log without fulfilling this
> dependency
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/9c373d0b5a1a59e2271d71c480d55a90a67b84cb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
