From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 29 Dec 2013 14:26:43 +0200
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227103511.2c218d17@skate>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <20131227103511.2c218d17@skate>
Message-ID: <20131229122643.GG8137@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 27, 2013 at 10:35:11AM +0100, Thomas Petazzoni wrote:
> >     xtensa |               gstreamer1-1.2.1 | NOK | 
> >     http://autobuild.buildroot.net/results/1fb5bde77ea84f13fe8db7dedda5b8a29671b939/
> 
> checking if unaligned memory access works correctly... configure: error: in `/home/test/test/2/output/build/gstreamer1-1.2.1':
> configure: error: cannot run test program while cross compiling
> 
> Baruch, can you have a look into this? Thanks!

I've just posted a patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
