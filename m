From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Sep 2017 08:04:19 +0200
Subject: [Buildroot] [PATCH v2 05/11] package/glibc: needs kernel
 headers >= 3.10 on powerpc64le
In-Reply-To: <20170912013726.474d54e8@windsurf>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-6-romain.naour@gmail.com>
 <20170910103032.GF3536@scaer>
 <ef182f62-d373-945b-c212-e5483c6d97a1@mind.be>
 <20170912013726.474d54e8@windsurf>
Message-ID: <20170912060419.GA3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2017-09-12 01:37 +0200, Thomas Petazzoni spake thusly:
> On Tue, 12 Sep 2017 01:05:18 +0200, Arnout Vandecappelle wrote:
> > 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 if BR2_powerpc64le
> "depends on ... if ..." is not a valid Kconfig construct if I remember
> correctly.

Indeed it is not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
