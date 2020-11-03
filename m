From: Matteo Pampolini <matteo.pampolini@gmail.com>
Date: Tue, 3 Nov 2020 08:53:48 +0100
Subject: [Buildroot] Enable gcc ADA support on latest LTS Buildroot
Message-ID: <CAEzkdfrXmUQc7N7a+j2zHayLLdzoUAy5kncQmewOwQ0-fSGVGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody,

I hope this is the right way to ask for such support.

I would like to enable ADA language to gcc together with the needed target
libraries, I'm using the latest LTS version of Buildroot. I saw an email
with a patch some years ago but it seems it was never put into the
Buildroot mainline. I tried just setting --enable-languages=ada in gcc
options but it fails, both gcc 8.x and 9.x.

May you please help me? Why is there no such configuration option just like
Fortran or D?

Many thanks for a kind answer,

Matteo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201103/79df13f1/attachment.html>
