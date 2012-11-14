From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Nov 2012 15:47:42 +0100
Subject: [Buildroot] How to build Kernel 2.6.x
In-Reply-To: <20121114153158.5de351df@skate>
References: <k7vnmj$27j$1@ger.gmane.org> <20121114153158.5de351df@skate>
Message-ID: <201211141547.42502.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Woody, All,

On Wednesday 14 November 2012 15:31:58 Thomas Petazzoni wrote:
> On Wed, 14 Nov 2012 17:19:15 +0800, woody wrote:
> 
> > I want to build kernel version 2.6.16 for ARM (s3c2410).  The 2.6.16 is
> 
> Why 2.6.16 ? This is prehistory.

And 2.6.16 does not know hos to headers_install. That came with 2.6.18,
and not even for all archs. IIRC, headers_install for arm was mostly
working at 2.6.20-something.

2.6.16 is tool old. Upgrade, and bang on your provider to upgrade.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
