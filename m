From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 16:55:57 +0200
Subject: [Buildroot] Qt tribulations take 2
In-Reply-To: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
References: <CALo-6+iZBhkaZJCOG8BLNOGfV36C_ZOHx+-U7hzuArLbrTmN4w@mail.gmail.com>
Message-ID: <20120713165557.1b39651c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Jul 2012 06:51:34 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> Let me start over with my Qt question.
> 
> I downloaded buildroot-2011.05 and ran several tests, each with "make

I presume you wanted to say 2012.05, right?

> clean && make" and each with C++ support checked, both with powerpc
> and arm and the results are the same, so either my understanding of
> what to click in xconfig is faulty (probable) or there is an issue in
> the Qt package scripts. In both cases, I can compile successfully
> without Qt checked and in both cases, I get into problems with Qt
> checked. I would have expected one of powerpc or arm to successfully
> compile and wonder if a suggestion could be made.
> Creating qmake. Please wait...
> make[1]: Entering directory
> `/home/ckrinke/buildroot-2012.05/output/build/qt-4.8.1/qmake'
> make[1]: c: Command not found
> make[1]: [project.o] Error 127 (ignored)
> make[1]: c: Command not found
> make[1]: [property.o] Error 127 (ignored)

Please send your Buildroot .config file.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
