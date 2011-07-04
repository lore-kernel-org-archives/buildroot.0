From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 5 Jul 2011 00:12:31 +0200
Subject: [Buildroot] [PATCH 13/28] syslinux: convert to GENTARGETS
In-Reply-To: <d09d6de7ba245ee9763b6f23e6df6fa6711194f8.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <d09d6de7ba245ee9763b6f23e6df6fa6711194f8.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107050012.31481.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:30 Thomas Petazzoni wrote:
> Moreover, the installation of pxelinux and/or isolinux is now selected
> to suboptions, as we traditionally do for other packages. This allows
> to have a single option (BR2_TARGET_SYSLINUX) that enables the
> syslinux package.

You're doing two unrelated chances here:
 - adding new options
 - converting to GENTARGETS

In case something goes wrong, we would not know what of the two breaks.

Regards,
Yann E. MORIN.

PS. Yes, I'm in a review spree!
    It can happen when my toolchians are building in the background! ;-)
YEM.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
