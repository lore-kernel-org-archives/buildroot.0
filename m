From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 13:33:04 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20080618154253.7A97E3C744@busybox.net>
References: <20080618154253.7A97E3C744@busybox.net>
Message-ID: <d6cda7730806180933n1407f717s4c2596bcc5f28bcf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>        config BR2_GCC_VERSION_4_0_4
> -               depends !BR2_avr32 && !BR2_nios2
> -               depends BR2_DEPRECATED
> +               depends on !BR2_avr32 && !BR2_nios2
> +               depends on BR2_DEPRECATED
>                bool "gcc 4.0.4"

Hi Peter,

    I'm not familiar with the kconfig details.
    Is there a difference between depends and depends on? Or is it
just syntax sugar?

Cheers,
    Thiago A. Correa
