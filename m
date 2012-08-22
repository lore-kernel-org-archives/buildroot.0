From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 22 Aug 2012 13:18:51 +0000 (UTC)
Subject: [Buildroot] Compiling process
References: <1345630715.32281.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <5034B3CC.5070804@relinux.de>
Message-ID: <k12m7q$mlc$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-08-22, Stephan Hoffmann <sho@relinux.de> wrote:
> Am 22.08.2012 12:18, schrieb Zoran Djordjevic:

>> Also, does Qt need building X server, or it run independently of it ?
>
> I am currently working with QT without X. It runs directly on the Linux
> framebuffer.

You should also be able to build/use Qt-based X clients without
building an X server.  The same is true of any X client, regardless of
framework/widget-library.  You'll probably have to build Xlib, but you
shouldn't have to build an X server.  [I vaguely remember an X11
widget library that didn't use Xlib, but I think all the popular ones
do.]

>> Does some window manager have to be installed ?
>
> No, but you have to start the app with the "-qws" option.

Or with whatever option points the X-client Qt app at an X server on a
different host.

-- 
Grant Edwards               grant.b.edwards        Yow! What UNIVERSE is this,
                                  at               please??
                              gmail.com            
