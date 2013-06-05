From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 5 Jun 2013 15:16:20 -0700
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
In-Reply-To: <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
References: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
 <CAMYPSMpE=ziBR4TuRbkjG+78fcJ=DXA67ePTXTDBPDRv+asEyw@mail.gmail.com>
 <CALo-6+hLNK70Bdh7C+ViD+T8XgbpKdBorcsqZfvhNqz-cbcV5A@mail.gmail.com>
Message-ID: <CALo-6+jLazVYE_tXAyL+JVr6Duo-3yd+ayiX4PHOB5wiskBCKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech:

I have been working with your patch but seem to have gotten myself
into another "pickle" in that when I compile, I get the sequence
below. I will start again fresh in the morning with the original patch
and the nightly build from buildroot, which will be
buildroot-20130606.tgz.

Question, I presume the patch should apply against tonights buildroot?
If not, is there a nightly build you would recommend for applying to
patch to?

If you have a suggestion on the errors, that would be appreciated.

Hopefully you, Spenser or Prabu can get this and any remaining logic
into buildroot so Neon, OpenGl and EGLFS support becomes part of the
buildroot trunk, soon.

>>> qt5base 5.0.2 Extracting
xzcat /home/ckrinke/buildroot-20130605/dl/qtbase-opensource-src-5.0.2.tar.xz
| tar --strip-components=1 -C
/home/ckrinke/buildroot-20130605/output/build/qt5base-5.0.2  -xf -
>>> qt5base 5.0.2 Patching package/qt5//qt5base

Applying qt5base-mkspecs-files.patch using patch:
patching file mkspecs/devices/linux-buildroot-g++/qmake.conf
patching file mkspecs/devices/linux-buildroot-g++/qplatformdefs.h

Applying qt5base-uclibc-no-lfs.patch using patch:
patching file mkspecs/common/posix/qplatformdefs.h
>>> libgles undefined Configuring
>>> libgles undefined Building
>>> libgles undefined Installing to target
>>> libegl undefined Extracting
>>> libegl undefined Patching package/opengl//libegl
>>> libegl undefined Configuring
echo "No libEGL implementation selected. Configuration error."
No libEGL implementation selected. Configuration error.
