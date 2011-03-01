From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 1 Mar 2011 11:45:41 +0100
Subject: [Buildroot] 2011_02 qt compilation error
Message-ID: <AANLkTimU+hUM71bBWk7VGpsJ8wGsLNKNGqMy19oD1Am5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

trying to compile QT with external toolchain lead to:
In file included from ../../include/QtCore/qatomic_arm.h:1:0,
                 from
../../include/QtCore/../../src/corelib/arch/qatomic_arch.h:54,
                 from ../../include/QtCore/qatomic_arch.h:1,
                 from
../../include/QtCore/../../src/corelib/thread/qbasicatomic.h:227,
                 from ../../include/QtCore/qbasicatomic.h:1,
                 from
../../include/QtCore/../../src/corelib/thread/qatomic.h:46,
                 from ../../include/QtCore/qatomic.h:1,
                 from
../../include/QtCore/../../src/corelib/tools/qbytearray.h:45,
                 from ../../include/QtCore/qbytearray.h:1,
                 from ../../include/QtCore/../../src/corelib/tools/qstring.h:46,
                 from ../../include/QtCore/qstring.h:1,
                 from
../../include/QtCore/../../src/corelib/kernel/qobject.h:48,
                 from ../../include/QtCore/qobject.h:1,
                 from
../../include/QtCore/../../src/corelib/kernel/qcoreapplication.h:45,
                 from ../../include/QtCore/qcoreapplication.h:1,
                 from global/qt_pch.h:58:
../../include/QtCore/../../src/corelib/arch/qatomic_arm.h: In function
'void qt_removeObject(QObject*)':
../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
error: output number 1 not directly addressable
moc kernel/qtimer.cpp
compiling kernel/qtranslator.cpp
make[2]: *** [.obj/release-shared-emb-arm/qobject.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory
`/home/open-nandra/projects/buildroot_test/output/build/qt-everywhere-opensource-src-4.7.1/src/corelib'
make[1]: *** [sub-corelib-make_default-ordered] Error 2
make[1]: Leaving directory
`/home/open-nandra/projects/buildroot_test/output/build/qt-everywhere-opensource-src-4.7.1'
make: *** [/home/open-nandra/projects/buildroot_test/output/build/qt-everywhere-opensource-src-4.7.1/.compiled]
Error 2

Config in attachment.

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17493 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110301/ae3af664/attachment-0001.obj>
