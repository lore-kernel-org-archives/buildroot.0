From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Oct 2010 14:21:25 -0700
Subject: [Buildroot] nptl depends on uclibc
In-Reply-To: <4CACDCA0.1040103@daccii.it>
References: <4CACDCA0.1040103@daccii.it>
Message-ID: <AANLkTi=Z9Vxsh-aFrz+xZBoB-GtGO+Ts_2kpQRYBXgVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 6, 2010 at 1:31 PM, Daniele Salvatore Albano - Lavoro
<info@daccii.it> wrote:
> ?Hi,
>
> i'm trying to setup a development system using ct-ng with eglibc but, while
> configuring stuff, i've seen that only linuxthreads and linuxthreads old are
> usable and not nptl.
>
> Looking at configuration file i've seen that there is a depends on uclibc
> snapshot.
>
> Is this correct? NPTL should be default,

default not yet. When uclibc releases with nptl then it can.

 or, however, should be selectable
> when using eglibc and when using glibc.

thats a fair point.

>
> Thank you,
>
> Best Regards,
> Daniele
>
> --
> Daniele Salvatore Albano
> Consulente Informatico
> http://www.daccii.it
>
> Servizi:
> - Sviluppo di software di rete e standalone in C# e siti web PHP;
> - Realizzazione di sistemi embedded con Buildroot;
> - Realizzazione di CD di installazione di Ubuntu/Debian personalizzati;
> - Installazione e Amministrazione sistemi basati su Debian, Ubuntu, CentOS e
> Fedora.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
