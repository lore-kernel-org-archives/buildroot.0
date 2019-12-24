From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:55:15 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/dante: bump to version 1.4.2
In-Reply-To: <20191224094701.612213-1-fontaine.fabrice@gmail.com>
References: <20191224094701.612213-1-fontaine.fabrice@gmail.com>
Message-ID: <20191224135515.5bef1c47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 10:47:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add hash for license file
> - Drop second patch (not needed anymore as the sed expression s/-g//g
>   has been replaced by s/-g //g)
> - This bump fixes the build failure with latest libminiupnpc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8a92d5257ba3e6fd0ad56ddb0afad8b6edd40ae3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Drop second patch (not needed anymore)
>  - Drop third patch (issue is not reproduced by Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
