From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 13 Dec 2010 20:47:42 +0100
Subject: [Buildroot] [PATCH 05/14] toolchain: rework C++ options
In-Reply-To: <fb633b08677502c0569cfacde6bab08650e9fc74.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<fb633b08677502c0569cfacde6bab08650e9fc74.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012132047.42540.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 December 2010 17:27:41 Thomas Petazzoni wrote:
> Instead of having BR2_GCC_CROSS_CXX and BR2_INSTALL_LIBSTDCPP, with
> BR2_GCC_CROSS_CXX not being visible (and therefore being useless),
> let's just keep BR2_INSTALL_LIBSTDCPP to enable C++ in the toolchain
> and install C++ libraries on the target.
[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
