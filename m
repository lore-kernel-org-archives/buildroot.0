From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 19:03:25 +0200
Subject: [Buildroot] [PATCH 3/7 v5] package/uclibc: add missing hash for
	eXtensa
In-Reply-To: <5533DC18.7030907@mind.be>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <5ebea83fd4fa6be72e9176af095aa19a4e8b8e06.1429447148.git.yann.morin.1998@free.fr>
 <5533DC18.7030907@mind.be>
Message-ID: <20150419170325.GK4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-19 18:47 +0200, Arnout Vandecappelle spake thusly:
> On 19/04/15 14:44, Yann E. MORIN wrote:
> > This is a git snapshot, we can't have a hash for it.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  My reviewed-by still stands, but you should probably also fix the hash for arc,
> which currently still points at 2014.08 while we use 2014.12 and it's from github
> 
> none xxx uClibc-arc-2014.12.tar.gz

Damn, I did not even check that the version was correct. Thanks for
spotting! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
