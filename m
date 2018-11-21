From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 20:59:07 +0100
Subject: [Buildroot] [PATCH 1/1] mtd: fix build on riscv
In-Reply-To: <20181120185237.31403-1-fontaine.fabrice@gmail.com>
References: <20181120185237.31403-1-fontaine.fabrice@gmail.com>
Message-ID: <20181121205907.1ccefbd6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Nov 2018 19:52:37 +0100, Fabrice Fontaine wrote:
> Define _REENTRANT otherwise pthread detection will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b0e7978a997a2aae383161455b5d898b8c28e2e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mtd/mtd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
