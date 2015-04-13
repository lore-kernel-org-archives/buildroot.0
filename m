From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:26:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: Update fminf/fmaxf patch
In-Reply-To: <1428950853-19110-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428950853-19110-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150413222600.35ee721e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 13 Apr 2015 20:47:32 +0200, Bernd Kuhls wrote:
> mesa3d now ships with a pre-generated file nir_constant_expressions.c, so there
> is no need to patch nir_constant_expressions.py anymore. Furthermore the
> previous patch of .py forced a re-generation of the .c file during the build,
> but due to missing python-mako (removed during 10.5.3 bump) this will fail.
> 
> Fixes
> http://autobuild.buildroot.net/results/35f/35fc6608b1d984587abb86700a51bf763770c795/
> http://autobuild.buildroot.net/results/25b/25b43a1898d5f3b4e87efc3147b33972668aa52f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-Fix-runtime-error-with-uClibc.patch       |   34 +++++++-------------
>  1 file changed, 12 insertions(+), 22 deletions(-)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
