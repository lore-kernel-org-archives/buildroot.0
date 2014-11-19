From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 14:01:11 +0100
Subject: [Buildroot] [PATCH v3 1/4] libevdev: bump version to 1.3.1
In-Reply-To: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
References: <1415989875-22535-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141119140111.2025aba7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Fri, 14 Nov 2014 19:31:12 +0100, Peter Seiderer wrote:
> See [1] and [2] for details.
> 
> [1] http://lists.freedesktop.org/archives/input-tools/2014-September/001112.html
> [2] http://lists.freedesktop.org/archives/input-tools/2014-November/001123.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I've applied this series to the next branch, thanks. Note that on PATCH
3/4, I dropped EVEMU_AUTORECONF = YES from evemu.mk, since it was no
longer necessary: your patch switches from Git to a tarball, which has
the configure script already generated, and we no longer have any
patches that could touch configure.ac or Makefile.am and therefore
require an autoreconf.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
