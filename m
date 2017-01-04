From: scsijon <scsijon@lamiaworks.com.au>
Date: Wed, 4 Jan 2017 13:50:54 +1100
Subject: [Buildroot] The chrootable self-compiling toolchain and Buildroot
Message-ID: <ac914698-10b9-73b3-0db0-a34df10e9990@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


BarryK, creator of Puppy Linux has come across a few problems in 
building with buildroot!

Primarily:

[quote]I have been using Buildroot recently, to compile applications 
statically with uclibc-ng. Buildroot is great, but it has one major 
shortcoming -- it cannot create a chrootable self-compiling 
toolchain.[/quote]

The full message letting you know what's up is at 
http://barryk.org/news/?viewDetailed=00479

Could someone have a look at it please and if possible give some help as 
it also interests me and i'm sure quite a few other small linux builders 
who would like to update the full system, but can't because of what 
seems to be the loss of the  chrootable self-compiling toolchain function.

It would actually be nice to be able to build in top of buildroot.

thanks
scsijon
