From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Mar 2018 22:23:45 +0100
Subject: [Buildroot] [PATCH 2/2] support/check-bin-arch: exclude kernel
 modules for merged /usr
In-Reply-To: <876067obr5.fsf@dell.be.48ers.dk>
References: <cover.1520454419.git.yann.morin.1998@free.fr>
 <ce786b49c9bbe6a3e2ebde9ca28b56de86e68b2e.1520454419.git.yann.morin.1998@free.fr>
 <876067obr5.fsf@dell.be.48ers.dk>
Message-ID: <20180307212345.GD2578@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-03-07 21:45 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > When using a merged /usr, the kernel module path is really
>  > /usr/lib/modules, as /lib is a symlink to usr/lib .
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

But I forgot to update the manual with this new location! ;-)

Should I still cary your rev-tag in round 2?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
