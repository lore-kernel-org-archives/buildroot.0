From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:43:22 +0200
Subject: [Buildroot] [PATCH/next v2,1/1] duktape: new package
In-Reply-To: <20180905182320.7181-1-fontaine.fabrice@gmail.com>
References: <20180905182320.7181-1-fontaine.fabrice@gmail.com>
Message-ID: <20180905234322.44d7dff6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Sep 2018 20:23:20 +0200, Fabrice Fontaine wrote:
> Duktape is an embeddable Javascript engine, with a focus on
> portability and compact footprint.
> 
> Duktape is easy to integrate into a C/C++ project: add duktape.c,
> duktape.h, and duk_config.h to your build, and use the Duktape API
> to call Ecmascript functions from C code and vice versa.
> 
> http://www.duktape.org
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Use latest version
>  - Remove both patches (first one already in version, second one
>    abandonned)
>  - Depends on !BR2_STATIC_LIBS as upstream does not support static
>    linking
>  - Fix Config.in so lines are less than 72 characters

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
