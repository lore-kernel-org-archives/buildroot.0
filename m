From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 16:17:04 +0100
Subject: [Buildroot] Building qt5declarative
In-Reply-To: <CA+hj=Mp6A-2zunJnGDti5UWka1GXr3jiu+nJCvcfq3j46W7enQ@mail.gmail.com>
References: <CA+hj=Mp6A-2zunJnGDti5UWka1GXr3jiu+nJCvcfq3j46W7enQ@mail.gmail.com>
Message-ID: <20140102161704.1dc68193@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Wagner,

On Thu, 2 Jan 2014 15:34:40 +0100, Ivan Wagner wrote:

> I'm attempting to compile Qt5 including the declarative module.

Please post your .config and indicate which Buildroot version you are
using.

I'm also Cc'ing Fatih on this, so I'm keeping the below error messages.

> When running the target installation I get the following:
> 
> >>> qt5declarative 5.2.0 Installing to target
> cp -dpf /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/qml*
> /home/ivan/projects/buildroot/output/target/usr/bin
> cp -dpfr /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/qml
> /home/ivan/projects/buildroot/output/target/usr
> cp -dpf /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libQt5Qml*.so.*
> /home/ivan/projects/buildroot/output/target/usr/lib
> cp -dpf /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libQt5Quick*.so.*
> /home/ivan/projects/buildroot/output/target/usr/lib
> cp: cannot stat
> `/home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libQt5Quick*.so.*':
> No such file or directory
> make: *** [/home/ivan/projects/buildroot/output/build/qt5declarative-5.2.0/.stamp_target_installed]
> Error
> 
> It seems that the libQt5Quick module is not to be found... Has anyone
> faced the same problem?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
