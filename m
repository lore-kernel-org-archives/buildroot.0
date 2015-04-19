From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 10:16:29 +0200
Subject: [Buildroot] [PATCH 2/4] boot/uboot: add hash file
In-Reply-To: <20150419100836.40d7c13c@free-electrons.com>
References: <1429361566-3538-1-git-send-email-joerg.krause@embedded.rocks>
 <1429361566-3538-2-git-send-email-joerg.krause@embedded.rocks>
 <20150419100836.40d7c13c@free-electrons.com>
Message-ID: <20150419081629.GD4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, J?rg, All,

On 2015-04-19 10:08 +0200, Thomas Petazzoni spake thusly:
> On Sat, 18 Apr 2015 14:52:44 +0200, J?rg Krause wrote:
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---
> >  boot/uboot/uboot.hash | 2 ++
> >  1 file changed, 2 insertions(+)
> >  create mode 100644 boot/uboot/uboot.hash
> 
> Applied, thanks.
> 
> Once the hashes become mandatory, we'll have to take care of this
> package, since the user might download custom tarball / git version,
> which will not match the hash provided in the hash file. Cc'ed Yann on
> this.

OK, I'll consider this for my series making them mandatory. Thanks for
the heads-up.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
