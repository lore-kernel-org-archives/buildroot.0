From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Aug 2015 20:27:23 +0300
Subject: [Buildroot] [PATCH 3/3] package/rpm: add host variant
In-Reply-To: <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
 <1439486091-6564-3-git-send-email-james.knight@rockwellcollins.com>
 <20150818114453.05e19fae@free-electrons.com>
 <CALe+oY9v5rmHwqGPwzJyuo3tnbrc+okuygciyFheqOUmVvkOQg@mail.gmail.com>
 <20150818160332.GX2765@tarshish>
 <CALe+oY9u6XjFDnOurT7ELboULh6C3OUh+CiHxSS8toMPMD5atw@mail.gmail.com>
Message-ID: <20150818172723.GY2765@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

On Tue, Aug 18, 2015 at 12:36:05PM -0400, James Knight wrote:
> On Tue, Aug 18, 2015 at 12:03 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > An alternative solution would be to switch Buildroot to rpm 4.x (latest
> > version is 4.12.0). The 4.x series seems to be more actively maintained than
> > rpm5, and is the version of choice for most distros using rpm
> 
> Hmm... did not think of "downgrading". I guess if rpm4 was integrated
> into Buildroot I would not have this issue (at this point in time).
> After reading a bit of the upgrade-fork of rpm5, maybe it would be
> better to provide an rpm4 and rpm5 package. This would allow a builder
> to choose either the common variant over the "latest-greatest"
> variant. I'd be worried to just transition from rpm5 down to rpm4 in
> case any other developer would prefer using rpm5.

I wouldn't call rpm5 "latest". It has forked from rpm in 2008, and is 
developed independently. The current Buildroot version has not been updated 
since 2009, quite far from "latest". Switching to latest rpm 4.x could as well 
be considered a "bump".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
