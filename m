From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Jul 2010 21:26:54 +0200
Subject: [Buildroot] [PATCH 01/10] ext-toolchains: take into account
	other Glibc dynamic loader variants
In-Reply-To: <0a3f00ff9d6e41588457320552daa0388433ba02.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
	<0a3f00ff9d6e41588457320552daa0388433ba02.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007052126.54747.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 July 2010 18:58:54 Thomas Petazzoni wrote:
> External toolchains using Glibc have different names for the dynamic
> loader. Some of them name it ld-linux.so.*, while some others (such as
> the PowerPC and MIPS CodeSourcery toolchains) name it simply ld.so.*.
> 
> Therefore, we fix the glibc detection code to handle this case.
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
