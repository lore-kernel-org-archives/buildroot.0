From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 May 2014 10:52:47 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <20140513094426.335d2361@free-electrons.com>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
Message-ID: <20140513075247.GZ4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 13, 2014 at 09:44:26AM +0200, Thomas Petazzoni wrote:
> >        arm |                      lsof-4.85 | NOK | http://autobuild.buildroot.net/results/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
> 
> Missing TCP_* definitions. Weird because the toolchain has recent
> kernel headers (3.12) and uses glibc. Investigation needed.

http://patchwork.ozlabs.org/patch/345018/ seems applicable (but I didn't test).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
