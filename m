From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 21:38:55 +0200
Subject: [Buildroot] [PATCH v2,1/1] aircrack-ng: bump to version 1.2
In-Reply-To: <20180529215647.19952-1-fontaine.fabrice@gmail.com>
References: <20180529215647.19952-1-fontaine.fabrice@gmail.com>
Message-ID: <20180530213855.0ce61f07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 May 2018 23:56:47 +0200, Fabrice Fontaine wrote:
> - Remove patch (already in version)
> - Add three patches (first one sent and merged upstream, second and
>   third patchs retrieved upstream)
> - Move to autotools-package
> - Remove workaround for static handling of pthread as it isn't needed
>   anymore
> - Remove deactivation of libnl in static build as it isn't needed
>   anymore
> - Set libnl and zlib dependencies as optional and not mandatory
> - Add duma and libgcrypt optional dependencies
> - Update workaround for static handling of libpcap
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Peter Korsgaard):
>  - Make libnl and zlib optional
>  - Add libgcrypt support
>  - Add duma optional dependency

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
