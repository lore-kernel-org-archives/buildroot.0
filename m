From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 09:36:43 +0200
Subject: [Buildroot] [PATCH 2/2] binutils: add patch for 2.27 that fixes
 elf2flt segfaults
In-Reply-To: <20170410084238.13201-2-arnout@mind.be>
References: <20170410084238.13201-1-arnout@mind.be>
 <20170410084238.13201-2-arnout@mind.be>
Message-ID: <20170413093643.05ffb764@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 10:42:38 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

>  .../2.27/0011-arm-thumb-fix-elf2flt-segfault.patch | 927 +++++++++++++++++++++
>  1 file changed, 927 insertions(+)
>  create mode 100644 package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch

Thanks a lot for doing the bisection! However, this is really a big
patch. Do we understand what it does? Do we know if it is safe to
backport it on 2.27 without other patches? Isn't there a more minimal
fix for binutils 2.27?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
