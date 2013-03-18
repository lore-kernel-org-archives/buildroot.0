From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 18 Mar 2013 09:02:38 +0200
Subject: [Buildroot] Creating JFFS2 rootfs to SPI flash,
 and mounting it from kernel
In-Reply-To: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
References: <CAF-Ht3xbVBXzdjL5Jc9eC6XrswaA8MjQ2Jy9apFG29tMJNEs_w@mail.gmail.com>
Message-ID: <20130318070238.GN5654@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Juha,

On Mon, Mar 18, 2013 at 03:45:49PM +0900, Juha Lumme wrote:
> Or does that make any sense ? What would you recommend me to do ? Is JFFS2
> a good idea ? Should I consider RAMFS for root file system ?

You may also consider Squashfs which is a read-only filesystem, and should 
give better compression ratio than JFFS2.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
