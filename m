From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:28:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: fix hash
In-Reply-To: <20190715163833.2128-1-fontaine.fabrice@gmail.com>
References: <20190715163833.2128-1-fontaine.fabrice@gmail.com>
Message-ID: <20190717072855.15494579@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 18:38:33 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> When bumping to version 5.43, an incorrect hash was set
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/029ab289021edaf9820b47846e5d107cab6f3e28
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xscreensaver/xscreensaver.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
