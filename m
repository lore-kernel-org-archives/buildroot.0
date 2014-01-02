From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Thu, 2 Jan 2014 15:34:40 +0100
Subject: [Buildroot] Building qt5declarative
Message-ID: <CA+hj=Mp6A-2zunJnGDti5UWka1GXr3jiu+nJCvcfq3j46W7enQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm attempting to compile Qt5 including the declarative module.

When running the target installation I get the following:

>>> qt5declarative 5.2.0 Installing to target
cp -dpf /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/bin/qml*
/home/ivan/projects/buildroot/output/target/usr/bin
cp -dpfr /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/qml
/home/ivan/projects/buildroot/output/target/usr
cp -dpf /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libQt5Qml*.so.*
/home/ivan/projects/buildroot/output/target/usr/lib
cp -dpf /home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libQt5Quick*.so.*
/home/ivan/projects/buildroot/output/target/usr/lib
cp: cannot stat
`/home/ivan/projects/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libQt5Quick*.so.*':
No such file or directory
make: *** [/home/ivan/projects/buildroot/output/build/qt5declarative-5.2.0/.stamp_target_installed]
Error

It seems that the libQt5Quick module is not to be found... Has anyone
faced the same problem?

Regards,

Ivan
