From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jun 2017 22:38:46 +0200
Subject: [Buildroot] [PATCH] glmark2: Fix segmentation fault
In-Reply-To: <1497393603-16151-1-git-send-email-festevam@gmail.com>
References: <1497393603-16151-1-git-send-email-festevam@gmail.com>
Message-ID: <20170615223846.580c2b4d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Jun 2017 19:40:03 -0300, Fabio Estevam wrote:
> Running glmark2 on imx6 with kernel 4.11.4 and Mesa 17.1.2 leads to
> a segmentation fault.
> 
> Apply Lucas Stach's patch to fix the problem while upstream glmark2
> doesn't get fixed.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  ...eStateDRM-use-fixed-event-context-version.patch | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
