From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 21:12:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-29
In-Reply-To: <f38c57af-44a3-2766-2512-1f0e9f4f4f98@gmail.com>
References: <20180630060034.AFC6220A33@mail.bootlin.com>
 <f38c57af-44a3-2766-2512-1f0e9f4f4f98@gmail.com>
Message-ID: <20180630211216.193bca6b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jun 2018 20:30:44 +0200, Romain Naour wrote:

> >          arm |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/84222a111d7a4cecb14f9fb280ff5763d61ed592 |     
> >       x86_64 |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/d9265c7a1f9d6568d0a187dc52a08168e1954c91 |       
> 
> It seems that gcc 8.1.1 from the host (ArchLinux) is buggy, there is no such
> error with a Fedora 28 with gcc 8 installed.
> 
> 1)
> /usr/include/c++/8.1.1/type_traits:1054:12: internal compiler error:
> Segmentation fault
>      struct is_nothrow_move_constructible
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <https://bugs.archlinux.org/> for instructions.
> 
> 2)
> 
> /home/joseph/buildroot-test/instance-13/output/build/host-llvm-6.0.0/include/llvm/ADT/MapVector.h:104:3:
> internal compiler error: Segmentation fault
>    }
>    ^
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <https://bugs.archlinux.org/> for instructions.

Thanks Romain for the analysis. Joseph, could you bring this up to the
Archlinux maintainers ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
