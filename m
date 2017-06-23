From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Jun 2017 21:06:13 +0200
Subject: [Buildroot] [PATCH] uclibc: fix knock build issue
In-Reply-To: <20170622220723.GA20213@waldemar-brodkorb.de>
References: <20170622220723.GA20213@waldemar-brodkorb.de>
Message-ID: <20170623210613.6de348bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Jun 2017 00:07:23 +0200, Waldemar Brodkorb wrote:
> This patch sync's with GNU C library and removes __FAVOR_BSD.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/908/90863b5adb769a346acd3dc4bbe8d5fa497a0581/build-end.log
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/0001-remove-__FAVOR_BSD.patch | 373 +++++++++++++++++++++++++++
>  1 file changed, 373 insertions(+)
>  create mode 100644 package/uclibc/0001-remove-__FAVOR_BSD.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
