From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 15 Jan 2015 11:57:20 -0600
Subject: [Buildroot] Fwd:  Qt4 Application - Touch detection
In-Reply-To: <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
Message-ID: <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bjorn,

Thanks for the quick reply.

1. Is environment variable TSLIB_TSDEVICE set to the correct input
>    device found under /dev/input/eventX ?
> 2. Is environment variable QWS_MOUSE_PROTO set to
>    "tslib:/dev/input/eventX" ?


I do have a startup script where I export these variables prior to
ts_calibrate.  Do you want me to re-export them before running the
application? I export the following variables:

export TSLIB_TSDEVICE=/dev/input/event0
export TSLIB_TSEVENTTYPE=INPUT
export TSLIB_CONFFILE=/etc/ts.conf
export TSLIB_CALIBFILE=/etc/pointercal
export QWS_MOUSE_PROTO="Tslib:/dev/input/event0"

I do have a question - when I print the environment variables, these do not
show up. I use the 'printenv' command, and these are not listed. Is that a
problem?


 I used Qt 4.8.x on x86 with a touch screen. But I built it with
> buildroot and didn't copy it from a SDK. With that buildroot built Qt
> it worked very well.


I will test this out and reply back to you.

Thank you once again.
Regards

Santhosh





-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/7a28e6c2/attachment.html>
