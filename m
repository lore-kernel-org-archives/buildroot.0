From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 13 Dec 2010 20:51:09 +0100
Subject: [Buildroot] [PATCH 13/14] toolchain: more verbose in
	crosstool-ng backend
In-Reply-To: <7b20c8407580bff3fa1809440eaa6b1ea25ad91e.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<7b20c8407580bff3fa1809440eaa6b1ea25ad91e.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012132051.09453.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 December 2010 17:27:49 Thomas Petazzoni wrote:
> By default, Crosstool-NG hides all the details of the toolchain build
> process. However, this is inconsistent with the typical Buildroot
> build, and the rotating progress thing makes log file resulting from
> redirecting the Buildroot output a bit unusable. Therefore, switch the
> Crosstool-NG configuration to a more verbose default.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
