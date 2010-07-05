From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Jul 2010 21:27:21 +0200
Subject: [Buildroot] [PATCH 04/10] external-toolchain: support 64 bits
	glibc toolchains
In-Reply-To: <41ba3c02c9a077d732289378e0a346b94298b479.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
	<41ba3c02c9a077d732289378e0a346b94298b479.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007052127.21075.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 July 2010 18:58:57 Thomas Petazzoni wrote:
> On 64 bits glibc toolchains, the dynamic loader is named
> ld-linux-x86-64.so and not simply ld-linux.so. So, adjust the
> detection of the C library accordingly.
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
