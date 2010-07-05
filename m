From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Jul 2010 21:26:46 +0200
Subject: [Buildroot] [PATCH 07/10] external-toolchain: recognize uClibc
	64 bits toolchains
In-Reply-To: <e3bae80372d1327fc88436202825562178faf08d.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
	<e3bae80372d1327fc88436202825562178faf08d.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007052126.46978.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 July 2010 18:59:00 Thomas Petazzoni wrote:
> 
> With uClibc 64 bits toolchain, the dynamic loader is named
> ld64-uClibc.so.0 and not ld-uClibc.so.0. So, this commit adjust the
> uClibc detection code for external toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
