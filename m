From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 5 Jul 2011 00:27:11 +0200
Subject: [Buildroot] [PATCH 24/28] Improve TARGETS handling for
	bootloaders and kernel
In-Reply-To: <dd17a4cd8c4097bbeef45838f4c9dd11325c3aa8.1309815048.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <dd17a4cd8c4097bbeef45838f4c9dd11325c3aa8.1309815048.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201107050027.11292.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 04 July 2011 23:33:41 Thomas Petazzoni wrote:
[--SNIP--]
> This commit improves the package infrastructure so that it looks at
> BR2_PACKAGE_<pkg> for packages, BR2_BOOT_<pkg> for bootloaders and at
> the special BR2_LINUX_KERNEL for the linux package.

For consistency, I'd suggest using 'BR2_KERNEL_LINUX'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
