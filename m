From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 15 Jan 2015 16:09:05 -0600
Subject: [Buildroot] Fwd: Qt4 Application - Touch detection
In-Reply-To: <CALo-6+jTAcUEOWeES1rCUdSHS1NbccG6L+oEBB3VTJYMEu6coQ@mail.gmail.com>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
 <20150115200634.598a27a3@tux.kirchner>
 <CADKZYYL-uKCvyEU9w7eAWi-yZv4bky5dTEz+RpUNAJQchjw2-Q@mail.gmail.com>
 <20150115212231.08000b68@tux.kirchner>
 <CADKZYYJArGCAPBOkzTcKvc-BgiUieZpx0Qjw-0zDycwJVPAX5A@mail.gmail.com>
 <CALo-6+jTAcUEOWeES1rCUdSHS1NbccG6L+oEBB3VTJYMEu6coQ@mail.gmail.com>
Message-ID: <CADKZYYLrKJZGErU7_1K1LG9r6eL4SL5R665NAXastQqFn8Xhwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> On the invocation of the qt program, perhaps this argument might help
> -plugin Tslib:/dev/input/event0


Hello Charles,

Thanks for the suggestion, I tried it but there is still no difference.
Additionally I added a mouse pointer to be visible in my application and I
can see that the touchevent is picked up, just that it's completely off
even if I calibrate it every time at power up.

Regards

Santhosh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/a9315c57/attachment.html>
