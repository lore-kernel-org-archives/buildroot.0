From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jun 2014 11:50:46 +0300
Subject: [Buildroot] Facing error while cross compiling libglib2 package
 for Xtensa architecture
In-Reply-To: <CAJQMGxGNjUBhZ39BKgOf4vf09F3nyT=O9c4B9pRYOq7+kBuj2Q@mail.gmail.com>
References: <CAJQMGxGNjUBhZ39BKgOf4vf09F3nyT=O9c4B9pRYOq7+kBuj2Q@mail.gmail.com>
Message-ID: <20140605085046.GJ4193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi phani teja Movva,

On Thu, Jun 05, 2014 at 02:14:31PM +0530, phani teja Movva wrote:
> I am trying to cross compile libglib2 package for Xtensa architecture. I
> enabled locale/gettext and WCHAR in tool chain and libglib2 in packages.
> 
> I am facing the following issue :
> 
> ?/usr/bin/glib-genmarshal: line 105: /usr/bin/.libs/lt-glib-genmarshal:
> cannot execute binary file
> /usr/bin/glib-genmarshal: line 105: /usr/bin/.libs/lt-glib-genmarshal:
> Success
> make[3]: *** [stamp-gmarshal.h] Error 1
> make[3]: Leaving directory
> `/home/buildroot-xtensa-HiFi2-Snapshot/build_xtensa_dc233x90/glib-2.12.9/gobject'?
> 
>  Please help me regard in this issue.

Please attach your .config file so we may try to reproduce your problem. Can 
you also share your xtensa overlay?

Which version of Buildroot do you use?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
