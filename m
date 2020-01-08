From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 09:33:11 +0100
Subject: [Buildroot] [PATCH] package/libcurl: bump version to 7.68.0
In-Reply-To: <20200108074109.27474-1-peter@korsgaard.com>
References: <20200108074109.27474-1-peter@korsgaard.com>
Message-ID: <20200108093311.47560dcd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 Jan 2020 08:41:09 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Notice that 7.68.0 includes a Windows-only security fix:
> 
> - CVE-2019-15601: SMB access smuggling via FILE URL on Windows
>   https://curl.haxx.se/docs/CVE-2019-15601.html
> 
> So not applicable to Buildroot.
> 
> Update the license hash for a copyright year update:
> 
> -Copyright (c) 1996 - 2019, Daniel Stenberg, <daniel@haxx.se>, and many
> +Copyright (c) 1996 - 2020, Daniel Stenberg, <daniel@haxx.se>, and many
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
