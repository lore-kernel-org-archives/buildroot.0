From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Mar 2017 18:05:01 +0100
Subject: [Buildroot] [PATCH 2/2 next] toolchain/wrapper: fake __DATE_
 and __TIME__ for older gcc
In-Reply-To: <20170301231232.2bb432dc@free-electrons.com>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <3c4084fc0c3cf518c6fe170bebd83124730eba00.1487709136.git.yann.morin.1998@free.fr>
 <20170301231232.2bb432dc@free-electrons.com>
Message-ID: <20170302170501.GA3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-01 23:12 +0100, Thomas Petazzoni spake thusly:
> On Tue, 21 Feb 2017 21:32:36 +0100, Yann E. MORIN wrote:
> > +/* Returns false if SOURCE_DATE_EPOCH was not defined in the environment.
> > + *
> > + * Returns true if SOURCE_DATE_EPOCH is in the environment and represent
> > + * a valid timestamp, in which case the timestamp is formatted into the
> > + * global variables _source_ and _date_.
> 
> Shouldn't this be:
> 
> 	"global variables _date_ and _time_"
> 
> instead ?
> 
> If you confirm, then I can fixup this when applying.

Yes, obviously it's _time_ and _date_.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
