From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Apr 2016 23:07:55 +0200
Subject: [Buildroot] [PATCH] core/help: fix custom help without a .config
In-Reply-To: <20160416092808.18012cf9@free-electrons.com>
References: <1458509069-11960-1-git-send-email-yann.morin.1998@free.fr>
 <56F1C9D1.2010104@mind.be>
 <20160322235239.7a75f515@free-electrons.com>
 <87h9f2frh5.fsf@dell.be.48ers.dk>
 <20160416092808.18012cf9@free-electrons.com>
Message-ID: <20160416210755.GB3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2016-04-16 09:28 +0200, Thomas Petazzoni spake thusly:
> On Sat, 16 Apr 2016 00:16:06 +0200, Peter Korsgaard wrote:
> >  > Without this custom help thing, it is already possible to define some
> >  > custom make target in external.mk that will display some help. It won't
> >  > be available until a configuration is defined, but oh well, who reads
> >  > help texts anyway?
> > 
> > Yeah, I also think this adds too much complexity just for a pointer to
> > help text. I think we should drop it.
> 
> So will you revert it?

I'll send the patches to revert it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
