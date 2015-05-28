From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 May 2015 23:36:02 +0300
Subject: [Buildroot] [PATCH] gdbm: handle optional dependency gettext
In-Reply-To: <CAB0FRss9-+251CWRnMSi2NPe=ySQ4wMU4XRUbr-ye_B+xstitQ@mail.gmail.com>
References: <1432755579-10890-1-git-send-email-francois.perrad@gadz.org>
 <20150527195559.GZ2260@tarshish>
 <CAB0FRss9-+251CWRnMSi2NPe=ySQ4wMU4XRUbr-ye_B+xstitQ@mail.gmail.com>
Message-ID: <20150528203602.GK2260@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fran?ois,

On Thu, May 28, 2015 at 08:37:22PM +0200, Fran?ois Perrad wrote:
> 2015-05-27 21:55 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> > On Wed, May 27, 2015 at 09:39:39PM +0200, Francois Perrad wrote:
> >> gdbm itself is an optional dependency of perl
> >
> > Is this a fix for
> > http://autobuild.buildroot.net/results/940/9404e004ac24c5f3eedc8e7bc8afadd35983de70/
> >
> > ?
> 
> I found this dependency issue during my investigation for this build failure.
> But it is not the fix for it.

OK. Thanks.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
