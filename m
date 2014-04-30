From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Apr 2014 19:41:35 +0200
Subject: [Buildroot] [PATCH 0/9 v2] Bump and improve syslinux (branch
 yem/syslinux)
In-Reply-To: <116346836.14216421.1398873487894.JavaMail.root@openwide.fr>
References: <cover.1398789775.git.yann.morin.1998@free.fr>
 <116346836.14216421.1398873487894.JavaMail.root@openwide.fr>
Message-ID: <20140430174135.GB3336@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-04-30 17:58 +0200, Romain Naour spake thusly:
> ----- Mail original -----
[--SNIP--]
> | Here are a few patches to bump and enhance syslinux:
> |   - patches 1..4: preparatory fixing and cleanup patches
> |   - patches 5..6: new pacakges, dependency of the new syslinux
> |   - patch   7   : actual syslinux bump
> |   - patches 8..9: new options to install new types of blobs
[--SNIP--]
> I did a quick test on real hardware with extlinux 6.02 and BIOS-legacy configuration.
> I reused the same config as for 5.10-pre4, so it's ok for me :)
> 
> Tested using serial port and menu.c32 module.
> 
> Tested-by Romain Naour <romain.naour@openwide.fr>
> 
> Note: all *.c32 modules for the target are installed in $(HOST_DIR)/usr/share/syslinux/
> They can be installed in $(STAGING_DIR) instead ?

What are those .c32 modules? How are they to be used?

From what I can infer, I doubt we want them in $(STAGING_DIR); they
probably belong to either somewhere in $(TARGET_DIR) (in /boot ?) or to
$(IMAGES_DIR).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
