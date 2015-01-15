From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Jan 2015 14:27:50 -0800
Subject: [Buildroot] Fwd: Qt4 Application - Touch detection
In-Reply-To: <CADKZYYLrKJZGErU7_1K1LG9r6eL4SL5R665NAXastQqFn8Xhwg@mail.gmail.com>
References: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
 <20150115181324.48fc51e9@tux.kirchner>
 <CADKZYYKDoizsdEo28Ynwb=ndhJXmHW3Zoqx=aSpP-1BMnDYujw@mail.gmail.com>
 <CADKZYYK12mXBKQq=R2k7aAky-2i1FcfAyyaXqLdsnd5cpoQdXg@mail.gmail.com>
 <20150115200634.598a27a3@tux.kirchner>
 <CADKZYYL-uKCvyEU9w7eAWi-yZv4bky5dTEz+RpUNAJQchjw2-Q@mail.gmail.com>
 <20150115212231.08000b68@tux.kirchner>
 <CADKZYYJArGCAPBOkzTcKvc-BgiUieZpx0Qjw-0zDycwJVPAX5A@mail.gmail.com>
 <CALo-6+jTAcUEOWeES1rCUdSHS1NbccG6L+oEBB3VTJYMEu6coQ@mail.gmail.com>
 <CADKZYYLrKJZGErU7_1K1LG9r6eL4SL5R665NAXastQqFn8Xhwg@mail.gmail.com>
Message-ID: <CALo-6+gkbrsnvX4sy9ZKgycK2MzPU2wNRu7TQpCSJ9_2SmfYZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Interesting. I have an AM3517 and did all the things you did and it worked.
The -plugin was one of the last. It feels like this is some some of Qt
compile and invocation issue, not necessarily a root filesystem issue.

On Thu, Jan 15, 2015 at 2:09 PM, Santhosh Ramani <srcoolz@gmail.com> wrote:

> On the invocation of the qt program, perhaps this argument might help
>> -plugin Tslib:/dev/input/event0
>
>
> Hello Charles,
>
> Thanks for the suggestion, I tried it but there is still no difference.
> Additionally I added a mouse pointer to be visible in my application and I
> can see that the touchevent is picked up, just that it's completely off
> even if I calibrate it every time at power up.
>
> Regards
>
> Santhosh
>
>


-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/0d88fea8/attachment.html>
