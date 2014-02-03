From: Jeroen De Wachter <jeroen.de.wachter@telenet.be>
Date: Mon, 3 Feb 2014 19:56:02 +0100 (CET)
Subject: [Buildroot] [PATCH] Added menu entry to build squashfs host
 tools separately
In-Reply-To: <20140203112610.GB3651@free.fr>
References: <2146187109.45390160.1391089943313.JavaMail.root@telenet.be>
 <20140203112610.GB3651@free.fr>
Message-ID: <654548409.50074458.1391453762321.JavaMail.root@telenet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok,

I just wanted to make sure that when the squashfs host tools would be built, they'd show
as selected in the host utilities too (regardless of whether they'd been selected
separately or by enabling the squashfs file system image). I don't think that will be
the case with the current patch?

I didn't check the way host tools were selected for the other filesystems though. I have
no issues following convention :-)

Cheers,
Jeroen

----- Original Message -----
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Jeroen De Wachter" <jeroen.de.wachter@telenet.be>
Cc: buildroot at busybox.net
Sent: Monday, February 3, 2014 12:26:10 PM
Subject: Re: [Buildroot] [PATCH] Added menu entry to build squashfs host tools separately

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
