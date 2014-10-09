From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 9 Oct 2014 18:40:05 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <20141009180201.01d7ff1c@free-electrons.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
 <20141009150727.441ae173@free-electrons.com>
 <CA+TH9VnFAqd-4ZFQ3Bi2kcDD1rqX-de8BwvErpUxOhaytGF7EA@mail.gmail.com>
 <20141009180201.01d7ff1c@free-electrons.com>
Message-ID: <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2014-10-09 18:02 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,

Angelo could suffice ;) !

> Thanks, but I know nothing about Mono, so what command am I supposed to
> run on the target to reproduce the issue?

Sorry, sometimes I forget my stupidity ...

Attached you can find a minimal mono example.

You can compile it with:

mcs weblient.cs

and run it with

mono webclient.exe http://www.google.com

It should suffice for triggering the error.

Again, thank you!

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
A non-text attachment was scrubbed...
Name: webclient.cs
Type: text/x-csharp
Size: 767 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141009/89dfd5b9/attachment.bin>
