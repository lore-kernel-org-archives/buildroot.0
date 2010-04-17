From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 17 Apr 2010 20:35:00 +0300
Subject: [Buildroot] codesourcery as external toolchain
In-Reply-To: <20100417170752.38a18d39@surf>
References: <n2k5fbe85791004140147maf9b040cx4f4adeda4ce1c339@mail.gmail.com>
	<20100417021617.502e76f8@surf>
	<n2o5fbe85791004162357h11a18ae5v1db91f6fefb81db6@mail.gmail.com>
	<20100417170752.38a18d39@surf>
Message-ID: <20100417173458.GA17637@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Apr 17, 2010 at 05:07:52PM +0200, Thomas Petazzoni wrote:
> I don't think CodeSourcery provides Linux/uClibc toolchains. If you
> want one, I think you have no other solutions that building your own,
> using Crosstool-NG.

Rob Landley's provides a pre-built uClibc based toolchains as part of Firmware 
Linux.  See http://impactlinux.com/fwl/downloads/binaries/.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
