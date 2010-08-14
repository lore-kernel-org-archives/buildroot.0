From: Mitch Davis <mjd+buildroot@afork.com>
Date: Sat, 14 Aug 2010 10:27:25 +1000
Subject: [Buildroot] About cygwin
In-Reply-To: <AANLkTikn0oGbsQFbPg-JeX7=5EnY-3AyYpVNPk7qkYkh@mail.gmail.com>
References: <AANLkTikn0oGbsQFbPg-JeX7=5EnY-3AyYpVNPk7qkYkh@mail.gmail.com>
Message-ID: <AANLkTinY8Ko+8=1yu0-AMUcP16rawcb=YydUhYh=RSh3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 14, 2010 at 10:21 AM, Michael Qiu <fallwind@gmail.com> wrote:
> ??I've already got a working buildroot environment in linux. But now I need
> a cygwin version, I realized it's not easy to build kernel on windows, my
> target is a working toolchain on cygwin which has the same version and
> configurations as the linux one.

I haven't heard anything about buildroot working on Cygwin.  If you're
just after a toolchain, you may like to look at crosstool-ng:

  http://ymorin.is-a-geek.org/projects/crosstool

That page says that Cygwin can act as a host.

Disclaimer: I may be wrong as I'm not part of buildroot team, just
trying to help.

Mitch.
