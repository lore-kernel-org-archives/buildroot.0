From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 10 Apr 2016 08:34:26 +0300
Subject: [Buildroot] Running buildroot applications on ubuntu ?
In-Reply-To: <CAJ2oMh+cjERA+2-n+gFE8eQYoqEuDqoDS_GzamfUM6HNZ-SgDw@mail.gmail.com>
References: <CAJ2oMh+cjERA+2-n+gFE8eQYoqEuDqoDS_GzamfUM6HNZ-SgDw@mail.gmail.com>
Message-ID: <20160410053426.GB3364@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ran,

On Sun, Apr 10, 2016 at 08:18:09AM +0300, Ran Shalit wrote:
> Is it possible to run buildroot applications on ubuntu which uses the
> same processor ?

It should be possible.

> We build qemu on buildroot x86, but have difficulties running it on ubuntu.
> Is it possible to do that ?

What problem have you encountered?

Note that a Buildroot generated filesystem image contains its own libraries 
that may be different from the host (Ubuntu) ones. The easiest way to make 
sure you use the right libraries is to run in a separate chroot.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
