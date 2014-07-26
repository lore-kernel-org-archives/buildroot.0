From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jul 2014 19:13:31 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix includes for recent
 toolchains
In-Reply-To: <CADCpmyP74XPQXJ1_VNxdxQbsoCehZeJaks+sqecPCJVgyR8yig@mail.gmail.com>
References: <1406270536-17145-1-git-send-email-bisson.gary@gmail.com>
 <20140726093400.52ac81c2@free-electrons.com>
 <CADCpmyP74XPQXJ1_VNxdxQbsoCehZeJaks+sqecPCJVgyR8yig@mail.gmail.com>
Message-ID: <20140726171331.GA16976@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-07-26 10:06 -0700, Gary Bisson spake thusly:
> On Sat, Jul 26, 2014 at 12:34 AM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
> > On Thu, 24 Jul 2014 23:42:16 -0700, Gary Bisson wrote:
> > > Build was failing starting with CodeSourcery 2013.11 due to
> > > new v4l kernel headers.
> > Am I correct saying that this patch is superseded by your new
> > http://patchwork.ozlabs.org/patch/373918/ patch ?
> Indeed this patch no longer applies.

Thanks for confirming. I've marked that patch, as well as 373814, as
superseded in Patchwork.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
