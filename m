From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 5 Jul 2017 16:19:10 +0300
Subject: [Buildroot] [PATCH v6 2/2] fs/ext2: Add
 BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS option
In-Reply-To: <20170705131339.GH3499@scaer>
References: <20170705130100.441-1-s.martin49@gmail.com>
 <20170705130100.441-2-s.martin49@gmail.com>
 <20170705130929.ik7ckvllo764rnuv@tarshish>
 <20170705131339.GH3499@scaer>
Message-ID: <20170705131910.vogx2ytnatdafe5p@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Jul 05, 2017 at 03:13:39PM +0200, Yann E. MORIN wrote:
> On 2017-07-05 16:09 +0300, Baruch Siach spake thusly:
> > On Wed, Jul 05, 2017 at 03:01:00PM +0200, Samuel Martin wrote:
> > > +	  The default is "-O ^64bit", i.e. disable the 64-bit filesystem.
> > > +	  This is chosen because U-Boot versions before 2017.02 don't
> > > +	  support that filesystem option, which may render the system
> > > +	  unbootable if it is used.
> > 
> > Maybe also mention that this option is only useful for 2TB+ filesystems.
> 
> As S?bastien said, this is no longer true since release 1.43:
>     http://lists.busybox.net/pipermail/buildroot/2017-July/197007.html

As far as I can see S?bastien only said that 64bit is enabled by default since 
1.43. That does not mean that the 64bit feature is useful for smaller (and 
much more common) filesystems.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
