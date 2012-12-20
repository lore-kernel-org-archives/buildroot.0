From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Dec 2012 23:11:33 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-ng: update config fro
	glibc-based toolchains
In-Reply-To: <20121220230859.42de3da8@skate>
References: <1356040912-9830-1-git-send-email-yann.morin.1998@free.fr>
 <20121220230859.42de3da8@skate>
Message-ID: <201212202311.33345.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 20 December 2012 Thomas Petazzoni wrote:
> On Thu, 20 Dec 2012 23:01:52 +0100, Yann E. MORIN wrote:
> 
> > -CT_LIBC_VERSION="2.9"
> > +CT_LIBC_VERSION="2.14.1"
> 
> How does 2.14.1 plays with regard to RPC support? For now,
> toolchain/toolchain-external/Config.in assumes that glibc and eglibc
> toolchains have native RPC support. So if the bump to 2.14.1 implies
> the lack of native RPC support, then the "select
> BR2_TOOLCHAIN_HAS_NATIVE_RPC" should be removed.

Gah, indeed. I'll resend.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
