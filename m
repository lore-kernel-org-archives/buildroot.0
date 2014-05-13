From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 May 2014 10:01:02 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <20140513075247.GZ4096@tarshish>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
 <20140513075247.GZ4096@tarshish>
Message-ID: <20140513100102.14163e6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 13 May 2014 10:52:47 +0300, Baruch Siach wrote:

> On Tue, May 13, 2014 at 09:44:26AM +0200, Thomas Petazzoni wrote:
> > >        arm |                      lsof-4.85 | NOK | http://autobuild.buildroot.net/results/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
> > 
> > Missing TCP_* definitions. Weird because the toolchain has recent
> > kernel headers (3.12) and uses glibc. Investigation needed.
> 
> http://patchwork.ozlabs.org/patch/345018/ seems applicable (but I didn't test).

Indeed, but I'm not really convinced by the fix, seems strange that
--sysroot needs to be passed. More investigation is needed to validate
the proposed fix, I believe.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
