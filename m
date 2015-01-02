From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 16:41:45 +0100
Subject: [Buildroot] [PATCH 3/4 v9] pkg-download: silence downloads if
 make is silent
In-Reply-To: <20150102163657.76b1df89@free-electrons.com>
References: <cover.1420142462.git.yann.morin.1998@free.fr>
 <8537faa275be0b3bb0aec3da99d7aaf1c56db17c.1420142462.git.yann.morin.1998@free.fr>
 <20150101225639.2890512b@free-electrons.com>
 <20150101220239.GL4360@free.fr>
 <20150102163657.76b1df89@free-electrons.com>
Message-ID: <20150102154145.GD4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-02 16:36 +0100, Thomas Petazzoni spake thusly:
> On Thu, 1 Jan 2015 23:02:39 +0100, Yann E. MORIN wrote:
> 
> > Redirecting stdout is a further solution for those downloaders that
> > still want to output something on stdout, even when told to be quiet.
> > 
> > I could not test CVS, CP and SCP because we do use them in in-tree
> > packages, so it is just an additional precaution.
> 
> Well, do we want to take "additional precautions" ? While I
> originally found the redirect solution nice when you proposed it, the
> fact that it doesn't work with certain backends makes it not very
> useful. So I would tend to defer the work of being quiet to each
> individual backend, and not attempt to do anything specific at the
> wrapper level.

OK, will do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
