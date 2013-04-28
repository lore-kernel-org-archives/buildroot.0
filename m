From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Apr 2013 22:22:35 +0200
Subject: [Buildroot] xconfig "Save As" behavior
In-Reply-To: <874neq5ukn.fsf@dell.be.48ers.dk>
References: <517C387B.80205@ras.kells.com>
 <874neq5ukn.fsf@dell.be.48ers.dk>
Message-ID: <20130428202235.GB4571@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Rob, All,

On Sun, Apr 28, 2013 at 09:22:32PM +0200, Peter Korsgaard wrote:
> >>>>> "Rob" == Rob Schottland (buildroot) <arm@ras.kells.com> writes:
> 
>  Rob> In buildroot-2013.02 "make xconfig", I have found that the "Save As"
>  Rob> option from the File menu ignores the filename and directory entered
>  Rob> and saves instead to the original .config file, reporting
>  Rob> #
>  Rob> # configuration written to  {buildroot install directory}/.config
>  Rob> #
> 
>  Rob> Has this been reported previously?
> 
> Not that I'm aware of.
> 
> I just checked, and it is still behaving like that in current git. As
> you might know, we're using kconfig from the Linux kernel, so I checked
> there (3.9-rc8), and it also behaves like that.
> 
> With other words, the bug is not caused by the buildroot integration.
> 
> Yann, any ideas how to fix this?

NOOOOoooo! Not yet another kconfig issue, please! :-]

I never ever tried xconfig so far. I'll have a look when time permits.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
