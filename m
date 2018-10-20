From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:30:49 +0200
Subject: [Buildroot] [PATCH v2,1/1] xerces: fix build without pthread
In-Reply-To: <20181012165433.7403-1-fontaine.fabrice@gmail.com>
References: <20181012165433.7403-1-fontaine.fabrice@gmail.com>
Message-ID: <20181020203049.69bc2f1c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Oct 2018 18:54:33 +0200, Fabrice Fontaine wrote:
> Don't fail when pthreads is not available
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/63cc4d3d69db19d0c639437d6996f881888a926b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Use the patch merged upstream

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
