From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Jul 2015 15:40:07 +0300
Subject: [Buildroot] [PATCH v4 1/1] mosh: new package
In-Reply-To: <20150724090732.6c27c55a@free-electrons.com>
References: <1437688804-26537-1-git-send-email-christian@paral.in>
 <20150724090732.6c27c55a@free-electrons.com>
Message-ID: <20150724124006.GA2371@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Jul 24, 2015 at 09:07:32AM +0200, Thomas Petazzoni wrote:
> On Thu, 23 Jul 2015 15:00:04 -0700, Christian Stewart wrote:
> > +comment "mosh needs a host architecture of x64 or x86"
> > +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> 
> Why ?

Copied from protobuf dependencies.

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
