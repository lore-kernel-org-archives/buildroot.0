From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 5 Jul 2010 21:27:14 +0200
Subject: [Buildroot] [PATCH 03/10] external-toolchain: only copy
	existing directories of the sysroot
In-Reply-To: <671dd67a882e2c9d0275115574b7d7cea27c9998.1278349072.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
	<671dd67a882e2c9d0275115574b7d7cea27c9998.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201007052127.14102.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 July 2010 18:58:56 Thomas Petazzoni wrote:
> Instead of copying all directories in "etc lib sbin usr", check that
> each of them exists before doing the copy. This is only to avoid an
> harmless error message.
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
