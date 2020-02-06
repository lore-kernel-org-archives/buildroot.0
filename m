From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Thu, 6 Feb 2020 17:52:13 +0100
Subject: [Buildroot] Qt5 Webkit fails to compile
In-Reply-To: <20200203151323.44f5d748@gmx.net>
References: <CAPmASevmB9AZ7yOMmR3dBPcc4-4Ra2NOgfGV-J=4TXy=_cxGmw@mail.gmail.com>
 <20200202194245.46e18d8e@gmx.net>
 <CAPmASevria8dFywjiy6_9ww+GCDw79k9LAmCaTz=XxwDqojjQQ@mail.gmail.com>
 <20200202220343.3164146d@gmx.net>
 <CAPmASeuDs2TE_=E+_qSf5E9PEMgfJth7e+SzbMikOZgzAeG2iA@mail.gmail.com>
 <20200203151323.44f5d748@gmx.net>
Message-ID: <CAPmASeuAWNJLMXHvYApAX3dC9xm9QhCGrNR6A8sqXkY0RdC9ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

>
> Maybe try to run e.g.:
>
>         $ export LANG=en_US.utf8
>
> before starting your application?
>


Unfortunately it does not change the behavior.
Perhaps I made a mistake in the locale configuration?

[*] Purge unwanted locales
>  ?   (it_IT) Locales to keep
>  ?   (it_IT) Generate locale data
>

Of course I tried exporting it_IT.utf8.
Best
Andrea S.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200206/4c80e4c6/attachment.html>
