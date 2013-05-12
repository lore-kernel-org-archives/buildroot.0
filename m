From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 May 2013 22:07:10 +0200
Subject: [Buildroot] [PATCH 1/6] package/pmake: add host pmake
In-Reply-To: <2d595758f38c257f4efb7ad18eee25888b192fd5.1368137904.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 10 May 2013 00:22:54 +0200")
References: <cover.1368137904.git.yann.morin.1998@free.fr>
 <cover.1368137904.git.yann.morin.1998@free.fr>
 <2d595758f38c257f4efb7ad18eee25888b192fd5.1368137904.git.yann.morin.1998@free.fr>
Message-ID: <87r4hcvu6p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> pmake is the make command used by the BSD.
 Yann> It will used to build BSD-related packages, coming later.

Committed to next, thanks.

 Yann> +# The generated file is named bmake, but we want pmake; but:
 Yann> +#  - pmake uses support files (in  mk/)
 Yann> +#  - it's not possible to tell pmake, at build-time, where to expect
 Yann> +#    these support files, and pmake expects them in /usr/share/mk/
 Yann> +#  - but pmake has an option to override that search path at runtime
 Yann> +#  - so we install bmake as bmake
 Yann> +#  - and we install a wraper named pmake that calls pmake with the

s/wraper/wrapper/

-- 
Bye, Peter Korsgaard
