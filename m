From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Mar 2015 01:11:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-03-06
In-Reply-To: <CAMo8BfJo6EJG4SeU3=ZEBB=9gG+SF9pJ9N0fCHh567o-jpfr5Q@mail.gmail.com>
References: <20150307073020.C6D511011A8@stock.ovh.net>
 <CAMo8BfJo6EJG4SeU3=ZEBB=9gG+SF9pJ9N0fCHh567o-jpfr5Q@mail.gmail.com>
Message-ID: <20150307231115.GA2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Sat, Mar 07, 2015 at 02:43:29PM +0300, Max Filippov wrote:
> On Sat, Mar 7, 2015 at 10:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Build statistics for 2015-03-06
> > Detail of failures
> > ===================
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/48f37bec20757e5632c162e1e04c07f32333e8e6/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/9db2415cb7c62818645e569113e163faf05cdfa6/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/8c62f67e90fc75fcaaf52769258f64edfebdfa43/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e107e75a9224ec88de7d96a46f99869ebc1752a4/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/b5cafae0bb7fa4a5d74f3b900bd16c44e3c4e5b7/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e9d775c90c7a92c0979161ef36becd52627de213/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/d816112d661ab02f259420a8dfae82f7d9131e46/
> >       xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/16818b5995a1be5c1e1c9158eac6cd4d4aa2080c/
> 
> it's been like that for about a week, two questions:
> - is anybody looking at it/going to take care of it?

See http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/108702.

> - is there any regression policy in the buildroot?

How is this a regression? uClibc-ng is a new package that was not included in 
any released version of Buildroot yet.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
