From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jan 2013 18:38:46 +0100
Subject: [Buildroot] [PATCH 1/4] Makefile: export a few variables to
	help support scripts
In-Reply-To: <87y5fwtacd.fsf@dell.be.48ers.dk>
References: <cover.1358113846.git.yann.morin.1998@free.fr>
 <877gngviel.fsf@dell.be.48ers.dk> <87y5fwtacd.fsf@dell.be.48ers.dk>
Message-ID: <201301141838.46833.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Monday 14 January 2013 Peter Korsgaard wrote:
[--SNIP--]
> And even worse, other projects also use the O=<dir> syntax for out of
> tree, and atleast uClibc doesn't check that it gets explictly passed on
> the command line, breaking the build.
> 
> So I'll remove the O.

Yes, as an afterthought, exporting $(O) was bad.

I was able to build both busybox and the Linux kernel with $(O), and I did
not think about uClibc. Ough... :-( And yesterday was too late for me to
spend more time on it, and removing $(O) would have been the first thing I
would have tried tonight. Sorry for the mess...

Thanks for the quick fix!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
