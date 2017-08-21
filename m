From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:23:10 +0200
Subject: [Buildroot] [PATCH] norm: fix build with gcc 7.x
In-Reply-To: <20170820135234.16037-1-thomas.petazzoni@free-electrons.com>
References: <20170820135234.16037-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170821232310.49a52f7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 15:52:34 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to the norm package that fixes the build with
> gcc 7.x. Many thanks to Romain Naour for pointing out the solution to
> this C++ build problem.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c79dc84cdc34d62199099eb4438b1aed3e7459bb/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/norm/0003-fix-const-qualifier-gcc7.patch | 44 ++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/norm/0003-fix-const-qualifier-gcc7.patch

Applied to master, after adding details regarding the upstream status
of the patch (it has been accepted).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
