From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 6 Nov 2011 10:02:04 -0600
Subject: [Buildroot] buildroot stops at pango compilation
In-Reply-To: <CAC=eiqyLq=uBboFLHDNM=ph4m8aOHcZN8799BL+5arheYLbeHw@mail.gmail.com>
References: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
 <20111106162606.491d895c@skate>
 <CAC=eiqyLq=uBboFLHDNM=ph4m8aOHcZN8799BL+5arheYLbeHw@mail.gmail.com>
Message-ID: <201111061002.06143.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun November 6 2011, Daniel Potapov wrote:
> On Sun, Nov 6, 2011 at 10:26 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > Please do not reply to me directly, but to the list instead. Thanks!
> 
> Yep! Sorry, I forogot it...
> 
> > Your config uses the ARM OABI, can you try with ARM EABI, which is the
> > standard these days ?
> >
> 
> Ok, I've checked EABI in buildroot config and uclibc, but compilation
> fails with messages:
> make: /home/user/buildroot/buildroot-2011.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc:
> Command not found
> make: *** [/home/user/buildroot/buildroot-2011.08/output/toolchain/uClibc-0.9.32/.configured]
> Error 127
> 
> where I can get arm-unknown-linux-uclibcgnueabi-gcc ?
> 
> 

Buildroot should have built it for you.
Did you do a 'make clean' ?

Mike
