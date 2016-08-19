From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:42:35 +0200
Subject: [Buildroot] [PATCH] openmpi: disallow on sparc
In-Reply-To: <1471553978-8096-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471553978-8096-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160819114235.501488b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 22:59:38 +0200, Thomas Petazzoni wrote:
> openmpi's configure script refuses to build on Sparc v8 architecture, so
> let's disable this package on sparc 32 bits entirely.
> 
> Fixes:
> 
>  http://autobuild.buildroot.net/results/be6cb8e2437d345b709cf76357a4420e9beadb5c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/openmpi/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
