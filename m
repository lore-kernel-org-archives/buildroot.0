From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:39:18 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix build on uclibc
In-Reply-To: <20180911185436.15777-1-fontaine.fabrice@gmail.com>
References: <20180911185436.15777-1-fontaine.fabrice@gmail.com>
Message-ID: <20180912103918.1f90dd6e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Sep 2018 20:54:36 +0200, Fabrice Fontaine wrote:
> uclibc does not have sys/auxv.h so disable getauxval
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0000636025b843ab343dc45ccd29979325aff428
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/botan/botan.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
