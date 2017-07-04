From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Jul 2017 23:56:05 +0200
Subject: [Buildroot] [PATCH 0/3 v3] skeleton: move ifupdown script to
 their own package
In-Reply-To: <20170704234934.458e6239@windsurf>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
 <20170704234934.458e6239@windsurf>
Message-ID: <20170704215605.GB3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2017-07-04 23:49 +0200, Thomas Petazzoni spake thusly:
> On Sun,  2 Jul 2017 16:35:16 +0200, Yann E. MORIN wrote:
> > Yann E. MORIN (3):
> >       package/ifupdown-scripts: new package
> >       package/ifupdown-scripts: not needed for systemd-networkd
> >       package/ifupdown-scripts: allow use with a custom skeleton
> 
> I've applied those patches. As discussed with Arnout and you, I've
> squashed PATCH 1 and PATCH 2. And in PATCH 1, I've removed the empty
> IFUPDOWN_SCRIPTS_SOURCE variable.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
