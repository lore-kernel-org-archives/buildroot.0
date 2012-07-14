From: Julian Lunz <git@jlunz.de>
Date: Sat, 14 Jul 2012 18:25:55 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
 <20120713165557.1b39651c@skate>
 <CALo-6+gv+zb1peT7ngOGLL7VnS6xpCUOZRn_J6CD86Kmn7vX=A@mail.gmail.com>
Message-ID: <20120714182555.4b7b267d@jl-desk-LL>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Took your provided config and gave it a try on my machine (32bit-Ubuntu
10.04). 
Went through without any hassles :/
What's your environment?


 On Fri, 13 Jul 2012 08:41:37 -0700
Charles Krinke <charles.krinke@gmail.com> wrote:

> My apologies, Thomas, I did mean buildroot-2012.05 and here is its
> .config renamed as dotconfig. In the mean time, I am frustrating
> myself with !#$%* openembedded in an attempt to glean some knowledge
> about how Qt fits together in an embedded environment as I slide into
> this new project.
> 
> Charles
> 
> On Fri, Jul 13, 2012 at 7:55 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Le Fri, 13 Jul 2012 06:51:34 -0700,
> > Charles Krinke <charles.krinke@gmail.com> a ?crit :
> >
> >> Let me start over with my Qt question.
> >>
> >> I downloaded buildroot-2011.05 and ran several tests, each with
> >> "make
> >
> > I presume you wanted to say 2012.05, right?
> >
> >> clean && make" and each with C++ support checked, both with powerpc
> >> and arm and the results are the same, so either my understanding of
> >> what to click in xconfig is faulty (probable) or there is an issue
> >> in the Qt package scripts. In both cases, I can compile
> >> successfully without Qt checked and in both cases, I get into
> >> problems with Qt checked. I would have expected one of powerpc or
> >> arm to successfully compile and wonder if a suggestion could be
> >> made. Creating qmake. Please wait...
> >> make[1]: Entering directory
> >> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
> >> make[1]: c: Command not found
> >> make[1]: [project.o] Error 127 (ignored)
> >> make[1]: c: Command not found
> >> make[1]: [property.o] Error 127 (ignored)
> >
> > Please send your Buildroot .config file.
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, Free Electrons
> > Kernel, drivers, real-time and embedded Linux
> > development, consulting, training and support.
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
