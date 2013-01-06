From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 6 Jan 2013 10:34:35 +0200
Subject: [Buildroot] [PATCH] divine: fix divine-config
In-Reply-To: <CAHXCMM+fy_WvvDgQfYTcyoiHAaSvbPuLv8P5p9em_=RRHMQ8rQ@mail.gmail.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
 <50E6BFE2.2090405@zacarias.com.ar>
 <CAHXCMMKhDpanjesHYjMSh-dcAHKt-84B3gEgyzs6UgN_8VRZvQ@mail.gmail.com>
 <50E6E757.10809@zacarias.com.ar>
 <50E6EDB5.9070004@petroprogram.com>
 <20130106054113.GD13545@sapphire.tkos.co.il>
 <CAHXCMM+fy_WvvDgQfYTcyoiHAaSvbPuLv8P5p9em_=RRHMQ8rQ@mail.gmail.com>
Message-ID: <20130106083433.GH13545@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sun, Jan 06, 2013 at 09:27:19AM +0100, Samuel Martin wrote:
> 2013/1/6 Baruch Siach <baruch@tkos.co.il>:
> [...]
> >
> > Good to see work on wireshark. Did you fix the RPATH problem I encountered
> > while trying to build tshark
> > (http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/48053) ?
> What do you mean by local build path? Paths to some build directories?

Yes.

> I've already done some work on this, but I lack some time to rebase,
> cleanup and submit :-/ (hope, I can switch back on it soon...)
> 
> If you'd like to have a look at it:
> https://github.com/tSed/buildroot/commits/sma/rpath-cleanup
> 
> especially these commits:
> 7e74622b02177063c4326aed6345e7920772b44b
> dbfec772a6b95e51427ebd58f301f2f4ad30296e

So is local build directories in RPATH currently a fact of life? If so can my 
wireshark package (linked above) be merged as is? Peter?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
