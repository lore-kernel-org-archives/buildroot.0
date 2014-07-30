From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Jul 2014 12:59:10 -0400
Subject: [Buildroot] lua interpreter choice?
Message-ID: <CANxTyt6-4j70z297t4VsaqKGosnTdWarc5fBVa3vVORmXnWMFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

With older buildroot releases, I was able to have lua and luajit side
by side.  After upgrading, I can *still* select both in the
menuconfig, but compiling give me:

'package/luajit/luajit.mk:75: *** Configuration error: both "luajit"
and "lua" are selected as providers for virtual package
"luainterpreter". Only one provider can be selected at a time. Please
fix your configuration.  Stop.'

I'm okay (I think) with disabling lua, as I don't *think* I need the
lighttpd "Lua support" option, which was forcing lua to be on.  If the
build will not allow both to be on then I'm wondering if, just as
libjpeg and jpeg-turbo are values for the "jpeg support" choice, if
the lua/luajit selection should be a choice rather than two separately
selectable packages?

Danomi -
