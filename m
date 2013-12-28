From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 20:33:17 +0100
Subject: [Buildroot] [PATCH 1/9] fs/iso9660: put the Buildroot boot
 entry first in Grub menu.lst
In-Reply-To: <1388242600-2580-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131228193317.GF3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-28 15:56 +0100, Thomas Petazzoni spake thusly:
> The ISO9660-specific Grub menu.lst contains two entries: one entry to
> chainload the bootloader available in the first hard drive, and
> another entry to boot the Buildroot system.
> 
> However, it defaults to booting the first entry, i.e chainloading
> what's on the first hard drive. For a Buildroot generated system, this
> is quite odd: we're not even booting the system built by Buildroot.
> 
> So, switch the two entries, and put the Buildroot boot entry first.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
