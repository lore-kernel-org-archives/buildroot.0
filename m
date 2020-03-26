From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:05:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtommath: fix build with
 latest moarvm on ARM
In-Reply-To: <20200326210343.126931-1-fontaine.fabrice@gmail.com>
References: <20200326210343.126931-1-fontaine.fabrice@gmail.com>
Message-ID: <20200326230507.1991894b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Mar 2020 22:03:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an upstream to enable mp_set_double on more architectures to fix the
> following build failure on moarvm with some ARM architectures:
> 
> linking moar
> ./libmoar.so: undefined reference to `mp_set_double'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/59d6b651498f3523d4a990eddc03c7d5043425ff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...bn_mp_set_double-c-on-more-platforms.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
