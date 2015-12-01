From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Dec 2015 14:20:54 +0200
Subject: [Buildroot] [PATCH] openocd: bump to 0.9.0
In-Reply-To: <CAGm1_ksRfJUZt=1Hm8Lzn7C=hCSJwgENG5ac6jLfRO06mt_gsg@mail.gmail.com>
References: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
 <20151201095826.GC2193@tarshish>
 <CAGm1_ks+db-1cASJWweJ6B2LHBa+zNfzj1V2+aQvdhFYbT=UOQ@mail.gmail.com>
 <20151201115651.0f1d7b34@free-electrons.com>
 <CAGm1_ksRfJUZt=1Hm8Lzn7C=hCSJwgENG5ac6jLfRO06mt_gsg@mail.gmail.com>
Message-ID: <20151201122054.GG2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Tue, Dec 01, 2015 at 12:25:46PM +0100, Yegor Yefremov wrote:
> On Tue, Dec 1, 2015 at 11:56 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Tue, 1 Dec 2015 11:33:25 +0100, Yegor Yefremov wrote:
> >
> >> Commit message states: Pass -std=gnu99, needed to build with a basic toolchain.
> >>
> >> I've commented this like and could successfully compile with musl +
> >> gcc 4.9.3 and also with Linaro ARM 2015.08 (GCC 5.x).
> >>
> >> @Thomas and @Claudio: any idea, what configuration produced compiling issues?
> >
> > Can you try with
> > http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config ?
> > This is what I call a "basic" toolchain, i.e a minimal uClibc toolchain
> > with no wchar and al. enabled.
> 
> Compilation *fails* without gnu99 with basic toolchain.

Just curious, do you have any idea why the build fails, and how -std=gnu99 
fixes the problem?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
