From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:21:34 +0100
Subject: [Buildroot] [PATCH/next 1/2] trace-cmd: fix site
In-Reply-To: <20181110174847.19674-1-fontaine.fabrice@gmail.com>
References: <20181110174847.19674-1-fontaine.fabrice@gmail.com>
Message-ID: <20181111212134.5e8a43dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Nov 2018 18:48:46 +0100, Fabrice Fontaine wrote:
> Replace $(BR2_KERNEL_MIRROR) by https://git.kernel.org/pub
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/trace-cmd/trace-cmd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

You targeted this patch for the next branch, but it fixes an actual
problem affecting the master branch, so I've applied to master instead.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
