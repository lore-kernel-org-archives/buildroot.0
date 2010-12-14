From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 14 Dec 2010 20:49:18 +0100
Subject: [Buildroot] [PATCH 02/13] php: libgmp was renamed to gmp
In-Reply-To: <1292353569-30172-3-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
	<1292353569-30172-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201012142049.18999.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Tuesday 14 December 2010 20:05:58 Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php/Config.ext |    2 +-
>  package/php/php.mk     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I think this should be folded into the previous patch.

First, with only the first patch, the build is broken.
Second, as a direct consequennce, it breaks bisecting.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
