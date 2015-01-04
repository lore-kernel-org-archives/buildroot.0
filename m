From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jan 2015 18:18:06 +0100
Subject: [Buildroot] [PATCH] package/janus-gateway: fix compilation with
 older gcc versions
In-Reply-To: <20150104180723.1b37f2e5@free-electrons.com>
References: <1420365575-25718-1-git-send-email-yann.morin.1998@free.fr>
 <20150104180723.1b37f2e5@free-electrons.com>
Message-ID: <20150104171806.GA31970@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-04 18:07 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sun,  4 Jan 2015 10:59:35 +0100, Yann E. MORIN wrote:
> > janus-gateway forcibly uses -Wunused-but-set-variable, which is not
> > available for all gcc versions. For example, gcc-4.5, as used in
> > Sourcery CodeBench PowerPC 2011.03, does not have it.
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/results/6d8/6d8e15ac5d592a51b6a8d2ceb9fc1ca954428ed7/
> >     http://autobuild.buildroot.org/results/abe/abe25b588bf6de0d76cce0135841d65dc66d5cca/
> >     [...]
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Gregory Dymarek <gregd72002@gmail.com>
> 
> I have an alternate version of this patch that does detect if
> -Wunused-but-set-variable is supported by gcc or not, and uses it only
> when available. I believe such a patch has a higher chance of being
> accepted upstream, no?

Yes, obviously. I'll mark my patch rejected in Patchwork, then.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
