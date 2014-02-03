From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2014 12:26:10 +0100
Subject: [Buildroot] [PATCH] Added menu entry to build squashfs host
 tools separately
In-Reply-To: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
References: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
Message-ID: <20140203112610.GB3651@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeroen, All,

On 2014-01-30 14:52 +0100, Jeroen De Wachter spake thusly:
> Before, the squashfs tools for host were only built when a squashfs
> root filesystem image was generated.

We already have such a patch to that effect (and only about showing it
in the menuconfig) waiting in the patchwork:
    http://patchwork.ozlabs.org/patch/306629/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
