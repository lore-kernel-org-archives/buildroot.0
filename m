From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Jan 2013 22:22:02 +0100
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
	*-config files
In-Reply-To: <50EF2F56.80304@petroprogram.com>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
 <201301102147.12993.yann.morin.1998@free.fr>
 <50EF2F56.80304@petroprogram.com>
Message-ID: <201301102222.03393.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 10 January 2013 Stefan Fr?berg wrote:
> 10.1.2013 22:47, Yann E. MORIN kirjoitti:
> > Also, I find the _FIXUP suffix to be misleading. 'fixup' conveys the
> > meaning that the flaws are fixed, so I'd naturally expect that the
> > *-config scripts are fixed, while this implementation removes them.
> > With _FIXUP, the developper may incorrectly conclude that some sed/awk/..
> > magic is done on these scripts.
> 
> Well, uh... there *is* some sed magic done to those scripts.

Oh sh!t... I mis-read another patch elsewhere for that patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
