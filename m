From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Oct 2010 09:18:44 +0200
Subject: [Buildroot] buildroot not support c++ compliing
In-Reply-To: <1286511827.3703.11.camel@olyvine-desktop.logiways-sz.cn>
References: <1286511827.3703.11.camel@olyvine-desktop.logiways-sz.cn>
Message-ID: <20101008091844.1afdb502@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 08 Oct 2010 12:23:47 +0800
"olyvine.chen at logiways.com.cn" <olyvine.chen@logiways.com.cn> wrote:

>   I now try to add package libmusicbrainz to buildroot, but many
> errors happen, such as the following:
> 
> *************************************************************************
> 
> buildroot/output/build/libmusicbrainz-3.0.2/src/artist.cpp:23:18:
> error: string: No such file or directory
> 
> *************************************************************************
>   it seems indicate that no c++ library available, then how to enable
> c ++ compiling for buildroot? 
>         
>   I enabled glibc via:
>   Toolchain => Toolchain type (External toolchain) => External
> toolchain C library (glibc)

Which external toolchain are you using ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
