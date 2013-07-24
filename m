From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 23 Jul 2013 21:25:52 -0700
Subject: [Buildroot] Recommended cross toolchain for ARM
In-Reply-To: <20130724032223.GA13697@zuhnb712.ap.bm.net>
References: <20130723060305.GA6169@zuhnb712.ap.bm.net>
 <4149687.113980.1374611608786.JavaMail.root@rockbochs.com>
 <20130724032223.GA13697@zuhnb712.ap.bm.net>
Message-ID: <CAJJ6jxusyrDUsf8gvrMLUhA226+5RkKzf+VWAnK9ikm_+T66eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is easy to install and build. And the worlds foremost expert is a major
contributor here (Yann).


On Tue, Jul 23, 2013 at 8:22 PM, Woody Wu <narkewoody@gmail.com> wrote:

> On Tue, Jul 23, 2013 at 03:33:28PM -0500, Tim Nelson wrote:
> > ----- Original Message -----
> > > Hi,
> > >
> > > Do you guys have a suggested cross toolchain?  I want to use glibc
> > > instead of uclibc, so in the buildroot default supported options, it
> > > left only Sourcery CodeBench (SCB).  But SCB seems not a very
> > > completed
> > > toolchain, when I use it to compile some of my applications, I found
> > > it
> > > missed with some definitions (such as RLIM_*) which should normally
> > > appear in a standard header file.
> > >
> > > Then I tried, Linaro, but it seems that it do not well support my
> > > armv5t
> > > core. Anyway, I run with errors after configured it with buildroot.
> > >
> > > So, is there a free ARM cross toolchains which is in one hand
> > > workable
> > > with buidroot and on the other hand contains all the necessary things
> > > that normally required to build applications.
> > >
> > > Thanks in advance!
> > >
> >
> > I've had good luck with building my own using crosstool-ng[1].
> >
> > --Tim
> >
>
> Is that easy to learn?
>
> > [1] http://crosstool-ng.org/
>
> --
> I can't go back to yesterday - because I was a different person then
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130723/e0d96b3f/attachment.html>
