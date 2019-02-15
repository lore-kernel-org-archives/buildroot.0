From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:43:50 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libmad: remove
 LIBMAD_LIBTOOL_PATCH=NO
In-Reply-To: <20190214215315.8491-1-fontaine.fabrice@gmail.com>
References: <20190214215315.8491-1-fontaine.fabrice@gmail.com>
Message-ID: <20190215224350.34663370@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Feb 2019 22:53:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since commit eae18d01abc737182fe171c908462499d5f1aaf0 "libmad: needs
> autoreconf", autoreconf builds an up to date ltmain.sh so remove
> LIBMAD_LIBTOOL_PATCH = NO which is not needed anymore
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libmad/libmad.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
