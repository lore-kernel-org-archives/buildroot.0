From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 May 2019 14:48:34 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/uboot-tools: fix build with host-openssl
In-Reply-To: <20190430170115.27891-1-fontaine.fabrice@gmail.com>
References: <20190430170115.27891-1-fontaine.fabrice@gmail.com>
Message-ID: <98c8488a-66ab-2779-1321-cf65b073873d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/04/2019 19:01, Fabrice Fontaine wrote:
> As suggested by Arnout during review of previous iteration, add a patch
> to uboot-tools so it uses CFLAGS and not HOSTCFLAGS when building cross
> tools
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/915b509e814bda16be54a24276b9c740c51e5770
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Upstream status?

 Regards,
 Arnout
