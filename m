From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 2 Oct 2015 12:17:02 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-10-01
In-Reply-To: <20151002063015.46A03101CE3@stock.ovh.net>
References: <20151002063015.46A03101CE3@stock.ovh.net>
Message-ID: <20151002091702.GC13467@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Oct 02, 2015 at 08:30:15AM +0200, Thomas Petazzoni wrote:
> Build statistics for 2015-10-01
> ===============================
> 
>          arm |               cryptsetup-1.6.7 | NOK | http://autobuild.buildroot.net/results/459912ff3ee9185ae58eccd61181010d56c544e8/

  CCLD     veritysetup
/home/peko/autobuild/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-musleabihf/4.9.3/../../../../arm-buildroot-linux-musleabihf/bin/ld: veritysetup-veritysetup.o: undefined reference to symbol 'libintl_bindtextdomain'
/home/peko/autobuild/instance-2/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/lib/libintl.so.8: error adding symbols: DSO missing from command line

A gettext/musl build issue. I remember you investigated this issue and 
reported to the list some time ago, but I can't find it in the archive now, 
and google fails me. Can you point me to that message?

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
