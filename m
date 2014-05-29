From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 May 2014 06:25:10 +0300
Subject: [Buildroot] python 2 or 3
In-Reply-To: <20140528194852.fe13e0e104246a21d4742916@lavabit.com>
References: <20140528194852.fe13e0e104246a21d4742916@lavabit.com>
Message-ID: <20140529032510.GK20069@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Wed, May 28, 2014 at 07:48:52PM -0700, rh_ wrote:
> python won't build, I am trying to build with -static.
> Should I abandon any hope of making this work?
> I am building for ARM.
> 
> Fails on "Multiple definitions of setreuid" and friends.

Please post your .config file. This would enable us to diagnose the problem 
you see.

> Or is this a busybox problem?

Most likely not.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
