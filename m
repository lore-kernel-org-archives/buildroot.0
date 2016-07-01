From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 1 Jul 2016 23:37:32 +0200
Subject: [Buildroot] [PATCH v2 05/15] pkg-cmake.mk: export the fortran
 compiler path in the CMake toolchain file
In-Reply-To: <20160701230253.323b8cde@free-electrons.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-6-s.martin49@gmail.com>
 <20160701230253.323b8cde@free-electrons.com>
Message-ID: <CAHXCMMJKbkbgzNW37xrsY0F5bfVLeZBmFKWyRjoRiFdvi7fgzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 1, 2016 at 11:02 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  1 Jul 2016 18:29:10 +0200, Samuel Martin wrote:
>
>> +             -e 's#@@TOOLCHAIN_HAS_FORTRAN@@#$(if $(BR2_TOOLCHAIN_HAS_FORTRAN),1,0)#' \
>
> The BR2_TOOLCHAIN_HAS_FORTRAN variable doesn't exist at this point in
> the patch series, so shouldn't this patch come later?
>
> Or did you assume that because it doesn't exist, it's always false for
> the moment, and that this patch should be considered a "preparation"
> patch ?
Nope, I just screwed my rebase :-S

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
