From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Dec 2013 18:38:10 +0100
Subject: [Buildroot] [PATCH 5/6] toolchain-external: mark Microblaze
 external toolchains as deprecated
In-Reply-To: <1388143942-1187-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388143942-1187-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388143942-1187-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131229173810.GG3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-27 12:32 +0100, Thomas Petazzoni spake thusly:
> The Xilinx Microblaze external toolchains that we had support for are
> very old, and are causing a huge number of build issues. Thanks to
> Spenser Gilliland, we now have support for Microblaze in the internal
> toolchain backend, and the autobuilders have been using the internal
> toolchain backend since then. Therefore, it's time to deprecate those
> old and unusable external toolchains.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Revied-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
