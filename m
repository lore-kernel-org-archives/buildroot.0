From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jul 2017 15:13:39 +0200
Subject: [Buildroot] [PATCH v6 2/2] fs/ext2: Add
 BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
In-Reply-To: <20170705130929.ik7ckvllo764rnuv@tarshish>
References: <20170705130100.441-1-s.martin49@gmail.com>
 <20170705130100.441-2-s.martin49@gmail.com>
 <20170705130929.ik7ckvllo764rnuv@tarshish>
Message-ID: <20170705131339.GH3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-07-05 16:09 +0300, Baruch Siach spake thusly:
> Hi Samuel,
> 
> On Wed, Jul 05, 2017 at 03:01:00PM +0200, Samuel Martin wrote:
> > +	  The default is "-O ^64bit", i.e. disable the 64-bit filesystem.
> > +	  This is chosen because U-Boot versions before 2017.02 don't
> > +	  support that filesystem option, which may render the system
> > +	  unbootable if it is used.
> 
> Maybe also mention that this option is only useful for 2TB+ filesystems.

As S?bastien said, this is no longer true since release 1.43:
    http://lists.busybox.net/pipermail/buildroot/2017-July/197007.html

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
