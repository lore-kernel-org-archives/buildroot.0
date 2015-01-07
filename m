From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Jan 2015 08:30:46 +0200
Subject: [Buildroot] Newbie: building hdf5 for x86 32-bit --configure:
 error: C compiler cannot create executables
In-Reply-To: <9a6aa392add8416b984a427fd3d4d538@exch13-mail05.win.slac.stanford.edu>
References: <9a6aa392add8416b984a427fd3d4d538@exch13-mail05.win.slac.stanford.edu>
Message-ID: <20150107063046.GC2481@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ernesto,

On Tue, Jan 06, 2015 at 08:39:42PM +0000, Williams Jr., Ernest L. wrote:
> Another Newbie question.
> 
> I am now trying to build the hdf5 package for a 32-bit target.
> 
> I can't seem to track down this error:
> 
> checking for i686-buildroot-linux-uclibc-gcc... /afs/slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/ccache /afs/slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/i686-buildroot-linux-uclibc-gcc
> checking whether the C compiler works... no
> configure: error: in `/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14':
> configure: error: C compiler cannot create executables
> See `config.log' for more details

Use this clue. What do you see in config.log?

> make: *** [/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14/.stamp_configured] Error 77
> 
> Thanks in advance for any guidance.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
