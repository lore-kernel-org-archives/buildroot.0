From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Jul 2014 10:55:24 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-01
In-Reply-To: <20140702094513.6ec730f0@free-electrons.com>
References: <20140702063009.4715D1017F9@stock.ovh.net>
 <20140702094513.6ec730f0@free-electrons.com>
Message-ID: <20140702075524.GD9025@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 02, 2014 at 09:45:13AM +0200, Thomas Petazzoni wrote:
> >    powerpc |                  libnss-3.16.1 | NOK | http://autobuild.buildroot.net/results/81019bf21a3199ac962c986b96e26ee25f34a0a8/
> 
> Usage of target cflags when building things for the host:
> 
> cc1: error: unrecognized command line option "-mabi=spe"
> cc1: error: unrecognized command line option "-mfloat-gprs=double"
> as: unrecognized option '-me500x2'
> 
> Someone to look into that?

This should be fixed by 
http://git.buildroot.net/buildroot/commit/?id=ea7bb05c7b3e7a4e45ff1dc5fdedb6b073d62619.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
