From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 5 Jun 2013 10:36:29 -0700
Subject: [Buildroot] AM3517 Neon, OpenGL & EGLFS support
Message-ID: <CALo-6+h9ELx+Hp_OQB0kvrdv9mH1VKnrKKcTTXLNSYkK0vFhHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is probably a question for Prabu and Spenser as I undestand a
buildroot patch is on the near horizon for Qt5 and OpenGL.

I have downloaded last nights nightly build of buildroot and built Qt5
for ARM for the TI AM3517 as we try to move from Qt-4.8.2 to Qt-5.0.2
and am looking at three features that are currently disabled.

These are support for Neon, OpenGL & EGLFS.

I was able to add QMAKE_INCDIR_OPENGL_ES2, QMAKE_LIBDIR_OPENGL_ES2 &
QMAKE_LIBS_OPENGL_ES2 to the mkspec patch this week using last weeks
buildroot-20130529 and get OpenGL to compile pointing to my external
TI Graphics_SDK, but then get into trouble with EGLFS and later on
with VERSION in qt_module.prf. So, I think there is a bit more to the
problem then just adding constants to the mkspecs patch.

Can someone possibly describe more of what needs to be done in a
dialect of techno-babble that I understand to get these three features
supported for the AM3517, please?

-- 
Charles Krinke
