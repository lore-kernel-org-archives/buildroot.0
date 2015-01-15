From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 15 Jan 2015 14:44:36 -0600
Subject: [Buildroot] Fwd: Qt4 Application - Touch detection
In-Reply-To: <20150115212231.08000b68@tux.kirchner>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
 <20150115200634.598a27a3@tux.kirchner>
 <CADKZYYL-uKCvyEU9w7eAWi-yZv4bky5dTEz+RpUNAJQchjw2-Q@mail.gmail.com>
 <20150115212231.08000b68@tux.kirchner>
Message-ID: <CADKZYYJArGCAPBOkzTcKvc-BgiUieZpx0Qjw-0zDycwJVPAX5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> So, you did something like this?
> # export TSLIB_TSDEVICE=/dev/input/event0
> # export QWS_MOUSE_PROTO="tslib:/dev/input/event0"
> # <qtExample>
> And there the touch screen worked correctly? And your program didn't?


Yes that is correct. However, I still don't understand why export doesn't
work within a script. I understood your explanation; the TI file system
uses profile.d to export these variables again in bash. I will try doing
that with profile file in etc to make it part of the startup routine.

I'm going to try and compile my application with the Qt built by buildroot
and I will reply back with my findings.

Thanks once again for your patience and help.
Regards

Santhosh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/abc1e687/attachment.html>
