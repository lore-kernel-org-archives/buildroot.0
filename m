From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 14 Dec 2010 21:45:36 +0100
Subject: [Buildroot] [PATCH 07/13] toolchain: move sysroot to host dir
In-Reply-To: <201012142058.45571.yann.morin.1998@anciens.enib.fr>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
	<1292353569-30172-8-git-send-email-gustavo@zacarias.com.ar>
	<201012142058.45571.yann.morin.1998@anciens.enib.fr>
Message-ID: <201012142145.36146.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On Tuesday 14 December 2010 20:58:45 Yann E. MORIN wrote:
> On Tuesday 14 December 2010 20:06:03 Gustavo Zacarias wrote:
> > * Drop the BR2_STAGING_DIR option
> > * Hardcode STAGING_DIR to $(HOST_DIR)/usr/TUPLE/sysroot
> Why do you need that?
> The fact that the user can set this location is to be able to use the
> toolchain outside of buildroot, without need to relocate it.
> Something to do with what we wanted to do for the SDK, IIRC.

OK, forget my comment. Resolved on IRC:
- have the _staging_ to be the sysroot
- later, offer an option to move the _toolchain_

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
