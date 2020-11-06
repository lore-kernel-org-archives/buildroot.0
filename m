From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Fri, 06 Nov 2020 19:14:06 +0100
Subject: [Buildroot] [PATCH v2] board: add Orangepi Zero Plus support
In-Reply-To: <87k0v14m7z.fsf@dell.be.48ers.dk>
References: <20201029195331.3894-1-m.niestroj@grinn-global.com>
 <87k0v14m7z.fsf@dell.be.48ers.dk>
Message-ID: <87o8ka2w0h.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:
>
>  > Add initial support for Orangepi Zero Plus board:
>  > - U-Boot 2020.10
>  > - Linux 5.7.19
>  > - Default packages from buildroot
>
>  > This patch is based on Orangepi Zero Plus2 board support, so genimage
>  > configuration and description is copy pasted. One difference is that
>  > newer Linux and U-Boot are selected. Another difference is Ethernet
>  > support (Plus) instead of WiFi (Plus2).
>
>  > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
>  > ---
>  > changes v1 -> v2:
>  >  * rebase on Buildroot master
>  >  * bump U-Boot from 2020.04 to 2020.10
>  >  * bump Linux from 5.6.6 to 5.7.19
>
> Committed, thanks.
>
> I wonder if we could combine some of all these orangepi defconfigs and
> create a single build that works on multiple boards rather than
> maintaining all these almost similar files?

Both orangepi_zero_plus and orangepi_zero_plus2 use the same
processor. It seems like a good idea to unify them. Maybe next time
someone will want to bump orangepi_zero_plus2 it will be a good occasion
to test both boards with same Linux + U-Boot versions.

-- 
Marcin Niestr?j
