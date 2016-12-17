From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:20:07 +0100
Subject: [Buildroot] [PATCH v2] tinycbor: disable parallel build
In-Reply-To: <20161216223022.20266-1-ps.report@gmx.net>
References: <20161216223022.20266-1-ps.report@gmx.net>
Message-ID: <20161217142007.612fd03c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Dec 2016 23:30:22 +0100, Peter Seiderer wrote:
> Maybe fixes ([1]):
> 
>  make[1]: Entering directory `/home/peko/autobuild/instance-1/output/build/tinycbor-v0.4'
>  .config:8: *** missing separator.  Stop.
> 
> [1] http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>  - remove included qt5base change added by mistake...

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
