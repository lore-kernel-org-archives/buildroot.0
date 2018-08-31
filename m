From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 10:09:51 +0200
Subject: [Buildroot] [PATCH v2,1/1] qt: fix build on powerpc_e500mc
In-Reply-To: <20180830163146.4952-1-fontaine.fabrice@gmail.com>
References: <20180830163146.4952-1-fontaine.fabrice@gmail.com>
Message-ID: <20180831100951.1f66c797@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for this new iteration!

On Thu, 30 Aug 2018 18:31:46 +0200, Fabrice Fontaine wrote:
> gcc bug internal compiler error: in validate_condition_mode, at
> config/rs6000/rs6000.c:180744. Bug is fixed since gcc 7.
> Workaround is to set -mno-isel, see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60818 and
> https://gcc.gnu.org/ml/gcc-patches/2016-02/msg01036.html
> 
> This bug is also raised on BR2_powerpc_8540, BR2_powerpc_8548 and
> BR2_powerpc_e5500.

Just curious, how did you figure out that list of affected platforms ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
