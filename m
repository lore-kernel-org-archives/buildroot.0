From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 12:35:04 +0200
Subject: [Buildroot] [PATCH] micropython: require python3 on the host
In-Reply-To: <20191020082808.15908-1-judge.packham@gmail.com>
References: <20191020082808.15908-1-judge.packham@gmail.com>
Message-ID: <20191026123504.178cf930@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 21:28:08 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> There are some scripts used when building micropython that require
> python3 on the build host. Use BR2_PYTHON3_HOST_DEPENDENCY so this can
> be either be satisfied by installing it on the build host or by building
> the host-python3 package.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/b85b2214576030026a8e04d142a77a2648379417/
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/micropython/micropython.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
