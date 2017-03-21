From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Mar 2017 20:08:10 +0100
Subject: [Buildroot] [git commit] Makefile: add check of binaries
	architecture
In-Reply-To: <20170321172836.69a3026c@free-electrons.com>
References: <20170320212621.499227FB10@busybox.osuosl.org>
 <877f3imwcd.fsf@dell.be.48ers.dk>
 <20170321172836.69a3026c@free-electrons.com>
Message-ID: <20170321190810.GA3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2017-03-21 17:28 +0100, Thomas Petazzoni spake thusly:
> On Tue, 21 Mar 2017 17:24:34 +0100, Peter Korsgaard wrote:
> > Sorry for the late response (nice feature!), but doesn't this get very
> > confused if any package ever install any files with spaces or special
> > characters?
> 
> Yes, this would mess up if files have spaces in their names. I'll have
> to think about how to handle this. Suggestions from shell gurus are
> welcome, of course :)

Patch on the list:
    https://patchwork.ozlabs.org/patch/741713/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
