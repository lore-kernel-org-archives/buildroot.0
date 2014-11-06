From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 6 Nov 2014 14:03:25 +0200
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
In-Reply-To: <1415275171.11764.9.camel@abrodkin-8560l.internal.synopsys.com>
References: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
 <20141106115120.GG2234@tarshish>
 <1415275171.11764.9.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141106120325.GI2234@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Thu, Nov 06, 2014 at 11:59:32AM +0000, Alexey Brodkin wrote:
> On Thu, 2014-11-06 at 13:51 +0200, Baruch Siach wrote:
> > On Thu, Nov 06, 2014 at 02:47:22PM +0300, Alexey Brodkin wrote:
> > > When BR2_TARGET_OPTIMIZATION is used (with some specific compiler flags)
> > > it's expected that ALL target binaries will be built with specified options.
> > > 
> > > Currently uClibc is built with its own set of options.
> > > This change allows passing additional flags to uclibc build system.
> > > 
> > > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > > 
> > > Cc: Anton Kolesov <akolesov@synopsys.com>
> > > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > Cc: Peter Korsgaard <peter@korsgaard.com>
> > > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > 
> > Have you actually CCed all these addresses? I only see Thomas in the Cc: 
> > header, besides you.
> 
> That's why I add "Cc:" in commit message.
> Because "git send-email" automatically adds mentioned addresses to CC.

OK then. It seems that the list handler striped the addresses of list 
subscribers from the Cc header except that of Thomas.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
