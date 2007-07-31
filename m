From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 31 Jul 2007 18:02:46 +0200
Subject: [Buildroot] svn commit:	trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <20070731160220.4557AA466A@busybox.net>
References: <20070731160220.4557AA466A@busybox.net>
Message-ID: <20070731160246.GA9378@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2007 at 09:02:20AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-31 09:02:18 -0700 (Tue, 31 Jul 2007)
>New Revision: 19359
>
>Log:
>Remove duplicate patch
>
>Removed:
>   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-ipmisensors-20070314-1214.patch
>   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-ipmisensors-20070314-1214.patch

Did you even look if those two are identical?
They were not and you broke ipmisensor support for 2.6.22.1 :-(
