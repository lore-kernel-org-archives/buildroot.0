From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Nov 2016 10:22:51 +0100
Subject: [Buildroot] 2016.11-rc2 with really old versions of bash (RHEL5)
In-Reply-To: <45a3d09a-6045-638e-7e97-c4ecf1073054@mind.be>
References: <20161113210740.3a8cedb2@free-electrons.com>
 <582ce22d87e4_b6b11ecfac31990@ultri3.mail>
 <20161116231312.GA27675@free.fr>
 <7725a865-0665-5747-6bfb-518224e3825b@mind.be>
 <20161119083909.GA3614@free.fr>
 <45a3d09a-6045-638e-7e97-c4ecf1073054@mind.be>
Message-ID: <20161119092251.GB3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-19 10:05 +0100, Arnout Vandecappelle spake thusly:
> On 19-11-16 09:39, Yann E. MORIN wrote:
> > But oh well... We still need to know whether we still consider RHEL5 as
> > our oldest (unoffocially) supported platform, or if we just bite the
> > bullet and require bash-4.
> 
>  ThomasDS asked if it would be possible to support RHEL5 if you don't use
> BR2_EXTERNAL. Do you think that's feasible?

No.

Well, all is possible. But the cost would be too high, IMHO...

I have a patch locally that fakes asociative arrays usingeval as you
suggested. I'm testing it right now (it still works fien with bash-4,
at least! :-)). If it works with bash-3.1, I'll send it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
