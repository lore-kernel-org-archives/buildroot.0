From: Luciano Greiner <luciano.greiner@gmail.com>
Date: Thu, 16 Apr 2009 17:02:02 -0300
Subject: [Buildroot] A new QTOPIA error
In-Reply-To: <26fbce020904141244l627cf9a8udc8af0cc80af2148@mail.gmail.com>
References: <26fbce020904141244l627cf9a8udc8af0cc80af2148@mail.gmail.com>
Message-ID: <26fbce020904161302x7e94966bsa77c2981c308908a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nobody but me with QTOPIA compilation errors? I tryed to change host 3
times, and the same happens.

Thanks


Luciano Greiner



On Tue, Apr 14, 2009 at 4:44 PM, Luciano Greiner
<luciano.greiner@gmail.com> wrote:
> Hi. I installed a new basic debian host system to QTOPIA4. I've got no
> more g++ not found errors, but compilation fails with:
>
> compiling io/qabstractfileengine.cpp
> moc io/qbuffer.h
> /bin/sh: /root/buildroot/build_i386/qt-embedded-linux-opensource-src-4.5.0/bin/moc:
> No such file or directory
> make[2]: *** [.moc/release-shared-emb-x86/moc_qbuffer.cpp] Error 127
> make[2]: Leaving directory
> `/root/buildroot/build_i386/qt-embedded-linux-opensource-src-4.5.0/src/corelib'
> make[1]: *** [sub-corelib-make_default-ordered] Error 2
> make[1]: Leaving directory
> `/root/buildroot/build_i386/qt-embedded-linux-opensource-src-4.5.0'
> make: *** [/root/buildroot/build_i386/qt-embedded-linux-opensource-src-4.5.0/.compiled]
> Error 2
>
> Does anyone know what may be happening here?
>
> Thanks
>
> Luciano Greiner
>
