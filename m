From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:34:03 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gdb: host-texinfo needed for
 full gdb
In-Reply-To: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
References: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150911193403.77ff1703@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Tue,  8 Sep 2015 20:27:23 +0100, Brendan Heading wrote:
> Fixes :
> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
> 
> .. and many others.
> 
> when building the full gdb (ie not just gdbserver) on the host or target
> the "make install" phase seems to expect makeinfo (from texinfo) to be
> present.
> 
> Added a dependency so that the host always depends on host-texinfo, and
> the target depends on it if the full GDB is being built. No need to set
> ac_cv_prog_MAKEINFO anymore as it doesn't seem to achieve the desired
> effect.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

Following the discussion on the mailing list, I've merged Vicente's
proposal, and marked this patch as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
