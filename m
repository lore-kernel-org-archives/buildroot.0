From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 22:18:07 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain,
 glibc: Allow ARC big endian glibc builds
In-Reply-To: <20191206193924.18777-2-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
 <20191206193924.18777-2-vgupta@synopsys.com>
Message-ID: <20191206221807.6a33e36c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 11:39:22 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
> 
> Apparently big endian glibc builds just work, if we let the endian
> header allow that (which prev was #error).
> 
> The current ARC glibc version in buildroot arc-2019.09-rc1 already
> contains that fix.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an improved commit title/log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
