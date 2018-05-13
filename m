From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:45:50 +0200
Subject: [Buildroot] [PATCH 1/1] snort: fix build on sparc v8
In-Reply-To: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
References: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
Message-ID: <20180513214550.529cba8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Sergio in Cc.

On Thu, 10 May 2018 13:17:48 +0200, Fabrice Fontaine wrote:
> Add patch to remove -mcpu=v9 before checking sparc architecture
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/59625daa154e3136171dcb89bdc3b8b31dc85021
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/snort/0005-fix-sparc.patch | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/snort/0005-fix-sparc.patch

I would have preferred a Git-formatted patch, because the 4 existing
patches on the snort package are Git-formatted.

However, I haven't been able to find an upstream Git repository for
Snort, so I'm wondering how the existing Git-formatted patches have
been generated. Perhaps from a repository created locally using git
init+git add ?

Sergio, since you added the snort package, how did you generate the
patches ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
