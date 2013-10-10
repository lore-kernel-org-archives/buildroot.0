From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2013 09:12:51 +0200
Subject: [Buildroot] [PATCH 2 of 4] libnfnetlink: add license information
In-Reply-To: <8738oayyue.fsf@dell.be.48ers.dk>
References: <patchbomb.1381226814@argentina>
 <5c8fa6d049957876145a.1381226816@argentina> <8738oayyue.fsf@dell.be.48ers.dk>
Message-ID: <52565373.6040204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 22:27, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>   Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>   Thomas> ---
>   Thomas>  package/libnfnetlink/libnfnetlink.mk |  2 ++
>   Thomas>  1 files changed, 2 insertions(+), 0 deletions(-)
>
>   Thomas> diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
>   Thomas> --- a/package/libnfnetlink/libnfnetlink.mk
>   Thomas> +++ b/package/libnfnetlink/libnfnetlink.mk
>   Thomas> @@ -9,5 +9,7 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIB
>   Thomas>  LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
>   Thomas>  LIBNFNETLINK_AUTORECONF = YES
>   Thomas>  LIBNFNETLINK_INSTALL_STAGING = YES
>   Thomas> +LIBNFNETLINK_LICENSE = GPLv2+
>   Thomas> +LIBNFNETLINK_LICENSE_FILES = COPYING
>
> Hmm, I don't see that in any of the source files:
>
> grep -rls 'any later'
> m4/libtool.m4
> configure
> config.sub
> ltmain.sh
> build-aux/compile
> build-aux/config.sub
> build-aux/ltmain.sh
> build-aux/missing
> build-aux/depcomp
> build-aux/config.guess
> COPYING
> missing
> depcomp
> config.guess
>
> and src/libnfnetlink.c explicitly states:
>
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms of the GNU General Public License version 2 as published
>   * by the Free Software Foundation.
>
> So I dropped the '+' and committed, thanks.

  Perhaps we should report to the author that his README is inconsistent 
with the source?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
