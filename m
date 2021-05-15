From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 17:15:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] board/qemu/s390x: disable SSP when needed
In-Reply-To: <CAPi7W81urRrU69TH+g1jtG5oE6-bHHKOKjefQdS4wO=tnM8sog@mail.gmail.com>
References: <20210509130634.1105988-1-fontaine.fabrice@gmail.com>
 <20210515145614.GM2506@scaer> <87mtswdoob.fsf@oc8242746057.ibm.com>
 <CAPi7W81urRrU69TH+g1jtG5oE6-bHHKOKjefQdS4wO=tnM8sog@mail.gmail.com>
Message-ID: <20210515151530.GP2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander, Fabrice, All,

On 2021-05-15 17:09 +0200, Fabrice Fontaine spake thusly:
> Le sam. 15 mai 2021 ? 17:03, Alexander Egorenkov
> <egorenar@linux.ibm.com> a ?crit :
> > "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > > On 2021-05-09 15:06 +0200, Fabrice Fontaine spake thusly:
> > >> Fix build failure raised since commit
> > >> 810ba387bec3c5b6904e8893fb4cb6f9d3717466 by disabling SSP when needed
> > > Alexander, is this something we can expect to land in mainline?
> > yes, i'm already looking into it.

Awesome; thanks! :-)

> If it can helps, I sent the patch on the mailing list as suggested by
> Romain: https://marc.info/?l=linux-s390&m=162062472219221&w=2

Awesome too; thanks too! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
