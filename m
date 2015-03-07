From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 12:21:28 +0100
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: Add the option to
 download via git
In-Reply-To: <CA+TH9VkkqdJtyWBFGu2Jc13grJeBYO8pvEjX4XUi2YU1oL+RbQ@mail.gmail.com>
References: <1422636725-25148-1-git-send-email-angelo.compagnucci@gmail.com>
 <CA+TH9Vmg41ujOeGLgyBHVCaSe4oH+0xg3cv8Yej-o-ohJammiA@mail.gmail.com>
 <CA+TH9V=htTvNFv=5YY-VFSD4Lc_BnXSDH2+LPrsDa3B661T=mQ@mail.gmail.com>
 <20150306225318.GD4220@free.fr>
 <CA+TH9VkkqdJtyWBFGu2Jc13grJeBYO8pvEjX4XUi2YU1oL+RbQ@mail.gmail.com>
Message-ID: <20150307112128.GA4186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2015-03-07 10:08 +0100, Angelo Compagnucci spake thusly:
> 2015-03-06 23:53 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > Angelo, All,
> >
> > On 2015-03-04 15:55 +0100, Angelo Compagnucci spake thusly:
> >> >> Adding support for git downloading of a custom repository.
> > [--SNIP--]
> >> Any news on this?
> >
> > Sorry it takes so long, but we are just getting out of a release cycle
> > (i.e. the last month was a feature-freeze), and we're trying to catch up
> > with the currently 363-or-so patches pending in our patch-tracker:
> >     http://patchwork.ozlabs.org/project/buildroot/list/
> >
> > One reason that it takes so much time is that there are very
> > reviewers/testers that give feedback on patches (I have been myself not
> > very active in that activity recently), and Peter and Thomas have to do
> > the grunt work of the triaging, reviewing, testing and applying almost
> > all on their own...
> >
> > A little bit of help in reviewing those patches, testing them, triaging
> > the duplicates and so on... is very welcome.
> 
> I usually contribute to several Open Source software and I usually
> tend to lend a hand because it's fun!
> Unfortunately I'm still grasping the internal of Buildroot and I've
> not the necessary knowledge to help reviewing patches.
> I'm monitorin the mailing list everyday and in case I find something
> to work on, you can count on me!

That's great, and it is appreciated! :-)

> I'm open to some sort of mentorship if someone wants to help me became
> proficient and helpful!

Yes, sure. First, don't be afraid! Even a review that just looks at
typoes is much welcome. Start with simple changes, such as a version
bump and build-test it, in various configurations (mips, arm, ppc...
with uclibc or glibc, with or without threads...); for example, I try to
build for arm and i386with the "default" toolchain options then with a
"fat" toolchain (LFS, threads...)

If you find typoes, just reply to the patch, pointing the typoes.

If you find the change to be OK, you can reply to the patch with a mail
stating:

    Reviewed-by: Firstname NAME <your.name@example.net>

If you tested it, you can say something like (no need to be too verbose):

    [Firstname: build-tested for mips; run-tested on armel]
    Tested-by: Firstname NAME <your.name@example.net>

Also, you can have a look at our manual, where we have a full section
about how to contribute:
    http://buildroot.net/downloads/manual/manual.html#_contributing_to_buildroot

And again, each contribution counts! So thanks for yours! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
