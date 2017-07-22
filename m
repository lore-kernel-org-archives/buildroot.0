From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:30:43 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gnuradio: link with
 libatomic when needed
In-Reply-To: <20170705172301.2634-1-bernd.kuhls@t-online.de>
References: <20170705172301.2634-1-bernd.kuhls@t-online.de>
Message-ID: <20170722233043.43f73ef4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 19:23:01 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/528/52825918bf65b23241cd68d99513350703469294/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: use CMAKE_EXE_LINKER_FLAGS instead of CMAKE_C_FLAGS (Thomas)
> v2: fix typo CMAKE_CXX_FLAGS -> CMAKE_C_FLAGS (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
