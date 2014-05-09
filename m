From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 9 May 2014 10:14:16 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-08
In-Reply-To: <20140509063010.6A8B2100DED@stock.ovh.net>
References: <20140509063010.6A8B2100DED@stock.ovh.net>
Message-ID: <20140509071416.GQ3861@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot list,

On Fri, May 09, 2014 at 08:30:10AM +0200, Thomas Petazzoni wrote:
> microblazeel |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/1b3c1a4e0e043c5ab8ef03807a095a312a19a587/
>        arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/e06b1665546e2f85ff26eb487db667abef633477/
>        arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/6910ef6cebeb2c4cabb0467f87dfc3ec4be359f9/
>        arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/ff9ea039c88457a222c6b0433e019f64817e18be/
>        arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/52c384def2adf5f1eace38866d0271aa5332beda/

The build log shows:

checking whether the C compiler works... no
configure: error: in `/home/test/test/3/output/build/qdecoder-r12.0.5':
configure: error: C compiler cannot create executables

But I can't reproduce it here. Thomas, Peter, what's in config.log?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
