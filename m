From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:27:02 +0100
Subject: [Buildroot] [PATCH 1/7 v3] autobuild: add config option to set
 niceness
In-Reply-To: <f54d1b32d670e6b3db28e6810ad9ab1460176803.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <f54d1b32d670e6b3db28e6810ad9ab1460176803.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128152702.7949558a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:08 +0100, Yann E. MORIN wrote:
> When the machine running the autobuilder is shared, it is important
> that the autobuilder instances do not hog all of the CPU.
> 
> Add an option to the configuration, so that the user can set the
> niceness to run the instances with. By default, the niceness is 0,
> which means the current niceness.
> 
> Properly doing so would require setting up a container with proper
> CPU cgroup, but it's a bit complicated.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  scripts/autobuild-run | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
