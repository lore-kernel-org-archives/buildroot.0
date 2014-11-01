From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Nov 2014 23:25:33 +0100
Subject: [Buildroot] [PATCH 1/3] arc: add explicit selection of CPU
 templates ARC 750D and ARC770D
In-Reply-To: <20141101195531.GI10189@free.fr>
References: <1414677449-15937-1-git-send-email-abrodkin@synopsys.com>
 <1414677449-15937-2-git-send-email-abrodkin@synopsys.com>
 <20141101195531.GI10189@free.fr>
Message-ID: <20141101222533.GL10189@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2014-11-01 20:55 +0100, Yann E. MORIN spake thusly:
> On 2014-10-30 16:57 +0300, Alexey Brodkin spake thusly:
> > This separation allows to specify unique options and features for each
> > CPU.
> > 
> > For example ARC 770D has LLOCK/SCOND instructions built-in by default.
> 
> "built-in by default": does that mean some cores might not have atomics?
[--SNIP--]

OK, I was dequeuing from the bottom, so I got to read your previous
explanations after I reviewed this version of the series.

Forget what I say, and just considered this to be:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
