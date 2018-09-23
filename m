From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:23:38 +0200
Subject: [Buildroot] [PATCH 1/2] monkey: switch to cmake package
In-Reply-To: <f0cb06bc463b44e6fdfcbde7049e41c4814839ef.1537676555.git.baruch@tkos.co.il>
References: <f0cb06bc463b44e6fdfcbde7049e41c4814839ef.1537676555.git.baruch@tkos.co.il>
Message-ID: <20180923162338.2863bb85@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Sep 2018 07:22:34 +0300, Baruch Siach wrote:
> Since version 1.6.x the configure script is a wrapper around cmake. Use
> cmake directly since we want to make sure that cmake is available.
> 
> monkey no longer provides the libmonkey.so shared library. Remove the
> BR2_PACKAGE_MONKEY_SHARED option.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b07/b077720c16857b752f4f38b73619a6a62862f35f/
> http://autobuild.buildroot.net/results/799/799bcbd332f254fbf3d3547e5e52ac9463d58bcc/
> http://autobuild.buildroot.net/results/3b0/3b095ca77a900af724fbc79d9cc20cbb9931fe15/
> 
> Cc: Morgan Delestre <m.delestre@sinters.fr>
> Cc: David Pierret <david.pierret@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/monkey/Config.in |  6 -----
>  package/monkey/monkey.mk | 49 +++++++---------------------------------
>  2 files changed, 8 insertions(+), 47 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
