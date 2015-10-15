From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Oct 2015 00:13:05 +0200
Subject: [Buildroot] [PATCH v1] libv4l: fix missing libintl linking
In-Reply-To: <1444943175-9000-1-git-send-email-ps.report@gmx.net>
References: <1444943175-9000-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151016001305.082b5c06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 15 Oct 2015 23:06:15 +0200, Peter Seiderer wrote:
> Add missing libintl linking to utils/dvb and utils/keytable (patch
> Makefile.in because patching Makefile.am and autoreconf did not work).

Please patch Makefile.am. To make autoreconf work on this package,
simply add host-gettext to LIBV4L_DEPENDENCIES.

Then, submit the patch upstream, so that it gets integrated and we can
get rid of it at the next upstream release.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
