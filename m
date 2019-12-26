From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 13:45:00 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/quota: fix NLS build
In-Reply-To: <20191226110122.2623089-1-fontaine.fabrice@gmail.com>
References: <20191226110122.2623089-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226134500.16e44004@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 12:01:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9e40a5b97dcd52cdfbd11688426ecad70390d56b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Replace patch by QUOTA_GETTEXTIZE = YES

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
