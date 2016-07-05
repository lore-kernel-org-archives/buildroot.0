From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Tue, 5 Jul 2016 16:06:25 +1000
Subject: [Buildroot] [PATCH v3 2/6] Add documentation for merged
 defconfigs
In-Reply-To: <489e6359-291e-5920-87d6-da23fe8c5d0a@smile.fr>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
 <fb148ddadbc12c9a9437192761ba342237a27325.1467176798.git.sam.bobroff@au1.ibm.com>
 <489e6359-291e-5920-87d6-da23fe8c5d0a@smile.fr>
Message-ID: <20160705060625.GB27663@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 01, 2016 at 03:18:58PM +0200, Romain Naour wrote:
> Hi Sam,
> 
[snip]
> 
> This series has been discussed with other developers and we concluded that this
> feature is not the responsibility of Buildroot to generate a defconfig from
> partial configuration files.

Fair enough.

> Instead we recommend to use merge_config.sh from outside of Buildroot to
> generate the merged defconfig before calling make. Maybe we should add some
> documentation in the manual to explain how to use it.

That seems fine, it might even be possible to add something to
$(BR2_EXTERNAL)/external.mk to hook it directly into the Makefiles.

Could you elaborate a bit on what you mean by using merge_config.sh outside of
buildroot? Would the fragment files still be checked into buildroot somewhere
(but just not hooked into the build system) or would they be maintained outside
it?

> Best regards,
> Romain

Cheers,
Sam.
