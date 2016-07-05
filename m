From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:06:23 +0200
Subject: [Buildroot] [PATCH 1/5] texinfo: new host package
In-Reply-To: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160705150623.5b5d9a76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 11:46:55 +0200, Thomas Petazzoni wrote:
> We have tried multiple solutions to solve the "makeinfo" problem in
> binutils and gdb, without finding anything really convincing. So it
> seems like the easiest solution is to add a texinfo host package, and
> use it as a dependency of binutils/gdb when they are fetched from
> Git. This commit introduces just the host-texinfo package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/texinfo/texinfo.hash |  2 ++
>  package/texinfo/texinfo.mk   | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/texinfo/texinfo.hash
>  create mode 100644 package/texinfo/texinfo.mk

Entire patch series applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
