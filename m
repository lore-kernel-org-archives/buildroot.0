From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 4 Aug 2016 13:52:50 +0200
Subject: [Buildroot] imx6 platform var-som-solo
Message-ID: <CALtfCQZz4Pc9mhwr=7t37oyty-KWCPRackStkV67H6rSeu+1Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I'm trying to make a buildroot system with imx6 platform in the
var-som-solo development kit. I'm using the stable version of
buildroot buildroot-2016.05.

The problem I have, It's when I'm trying to compile QT5. I
can't select eglfs:

----------------------------------------
> Target packages > Graphic libraries and applications (graphic/text) > Qt5
>

...
 [*]       X.org XCB support
 *** eglfs backend available if OpenGL and EGL are enabled ***
 <------
(eglfs)   Default graphical platform
...
----------------------------------------

I made something similar with the raspberry pi 2B and I didn't have any
problem. I can't find how to select OpenGL and EGL to free the option to
select eglfs.

Can anyone how to do this?

Oscar Gomez Fuente.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160804/a32638e8/attachment.html>
