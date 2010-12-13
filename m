From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 13 Dec 2010 20:46:16 +0100
Subject: [Buildroot] [PATCH 02/14] toolchain: remove ending semi-colon
	in helpers
In-Reply-To: <2dcdf99548257a5907c8f77eb7a1b65d7295f135.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<2dcdf99548257a5907c8f77eb7a1b65d7295f135.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012132046.16330.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 December 2010 17:27:38 Thomas Petazzoni wrote:
> Some helpers had their final line ending with a semi-colon, some did
> not. For consistency, remove the final semi-colon from all helpers,
> it's the responsability of the caller to add the final semi-colon as
> needed.
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
