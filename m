From: Privat <zentrale.at.work@gmail.com>
Date: Tue, 28 Aug 2007 17:41:18 +0200
Subject: [Buildroot] BR fails to build native Toolchain for ARM
In-Reply-To: <vlg4M3cg8kYs.WS9Jk0yD@mailout.dof.se>
References: <vlg4M3cg8kYs.WS9Jk0yD@mailout.dof.se>
Message-ID: <46D4421E.7050909@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi all!
> 
> When using buildroot for arm, it fails to build a native toolchain with 
> the following error:
> 
> /usr/lib/libgmp.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
> 
> Config is gcc 4.2.1, binutils 2.17, uclibc 0.9.29
> Build system is centos 5.
> 
> I tried various gcc versions in br, but every time got the same result.
> 
> => I manage to build a
>  toolchain with this settings.
>  There are other settings 
>  which can be configured.
>  OABI, generic-arm, NWFPE
>   is what I use.
> 
> Best Regards
> Ulf Samuelsson
> 
>

usually I use OABI & NWFPE, too.

just FYI: gave it a retry on Debian 4.0 now, and it built fine whereas 
it failed on Fedora 7, Fedora 6 and CentOS 5. Seems like something 
RedHat-related now.

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.der.macht at gmail.com

watch out for:
www.rocksociety.de
