From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Jan 2019 10:13:53 +0100
Subject: [Buildroot] [PATCH 1/2] xenomai: remove unnecessary autoreconf
In-Reply-To: <87imyxrmk3.fsf@dell.be.48ers.dk>
References: <20190108203854.28015-1-patrickdepinguin@gmail.com>
 <20190109203332.GM4022@scaer> <87imyxrmk3.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LUTcDwSrhpnWo9N+d1APrjVP-KBAp1fX5z0DNaEBRdq5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El jue., 10 ene. 2019 a las 8:36, Peter Korsgaard
(<peter@korsgaard.com>) escribi?:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  >> -# 0002-boilerplate-build-obstack-support-conditionally.patch
>  >> -XENOMAI_AUTORECONF = YES
>  >>
>
>  > This is causing failures in the CI:
>
>  >     https://gitlab.com/buildroot.org/buildroot/pipelines/42622285
>
>  > because there are now two consecutive empty lines.
>
> Fixed, thanks. Odd that my check-package post-commit hook didn't catch
> it.

Oops, sorry.
Could you show me how to enable this as hook, then I'll add it locally too.

Thanks,
Thomas
