From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Mar 2020 21:43:56 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/connman: disable wireguard support
In-Reply-To: <20200326203735.GW22325@scaer>
References: <20200326152501.GA30362@P-NAN-EREVAN-mikbou>
 <20200326190106.GU22325@scaer>
 <b4c0ce8d-0c24-1f5b-bef8-3f900150759c@smile.fr>
 <20200326203735.GW22325@scaer>
Message-ID: <20200326204356.GX22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Mikael, All,

On 2020-03-26 21:37 +0100, Yann E. MORIN spake thusly:
> On 2020-03-26 21:30 +0100, Romain Naour spake thusly:
> > Le 26/03/2020 ? 20:01, Yann E. MORIN a ?crit?:
> > > On 2020-03-26 16:25 +0100, Mikael Bourhis-Cloarec spake thusly:
> > >> The new Connman 1.38 release uses 'WireGuard' and 'libmnl' by default now.
> Damn, iptables, not nftables. Your patch is still on the table, then.

In the meantime, Thomas applied another earlier pending patch that
actually enabled wireguard support.

So I've marked your patch as not applicable in patchwork.

Thanks for the contribution nonetheless! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
