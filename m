From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jul 2017 23:50:52 +0200
Subject: [Buildroot] [PATCH 4/4 v3] package/kvm-unit-test: available for
 big.LITTLE arm cores too
In-Reply-To: <20170722232953.40f3d5ab@windsurf>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <e9a53f9e66ea0d124e8c4ab028f01b41d694910d.1499592591.git.yann.morin.1998@free.fr>
 <20170722232953.40f3d5ab@windsurf>
Message-ID: <20170722215052.GG9929@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-22 23:29 +0200, Thomas Petazzoni spake thusly:
> On Sun,  9 Jul 2017 11:30:01 +0200, Yann E. MORIN wrote:
> > Since it supports each variants individually, it should also supports
> > the big.LITTLE configurations.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Cyril Bur <cyrilbur@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/kvm-unit-tests/Config.in | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Applied to master, thanks.

Alas, this is also causing kconfig issues:

    package/kvm-unit-tests/Config.in:5: syntax error
    package/kvm-unit-tests/Config.in:4: invalid option

I've sent a fix:
    https://patchwork.ozlabs.org/patch/792481/

Sorry about that. There realyl is something that I miossed in that
series... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
