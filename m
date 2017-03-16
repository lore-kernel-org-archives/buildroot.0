From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Mar 2017 09:48:26 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-03-15
In-Reply-To: <20170316072914.90D0F207E3@mail.free-electrons.com>
References: <20170316072914.90D0F207E3@mail.free-electrons.com>
Message-ID: <20170316074826.j4oczgsrxp57vmdy@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Thu, Mar 16, 2017 at 08:29:14AM +0100, Thomas Petazzoni wrote:
>       xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/439d6dacfaa7f9244bd15ca04990c12a25ff4777

  HOSTLD  tools/mkenvimage
  HOSTLD  tools/fdtgrep
cc1: error: unrecognized command line option "-mlongcalls"
cc1: error: unrecognized command line option "-mauto-litpools"
error: command '/usr/bin/gcc' failed with exit status 1

Host toolchain used instead of target. Can't reproduce it here.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
