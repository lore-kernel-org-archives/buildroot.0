From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:03:37 +0100
Subject: [Buildroot] [PATCH v6 1/1] cmake: bump to version 3.15.4
In-Reply-To: <20191027144014.126396-1-james.hilliard1@gmail.com>
References: <20191027144014.126396-1-james.hilliard1@gmail.com>
Message-ID: <92657dbc-ad9e-bf01-6558-f2297a7eccb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/10/2019 15:40, James Hilliard wrote:
> Remove FindLibUV patch which is now upstream.
> 
> Resync/reformat rename cmake rootfile patch for 3.15.4 with git format-patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

[snip]
>  # Locally calculated
> -sha256 9d8604f7afc5564ceb9705ba121f5fba2782ce18d92902f3c6ed338228372170  Copyright.txt
> +sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt

 When the license hash changes, you must mention in the commit message what has
changed in the license file. I've done that and applied to master, thanks.

 I've also applied the second patch of v3 of the series which bumps the minimum
cmake version.

 Thank you for being so persistent with this!

 Regards,
 Arnout

> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index e816963089..7c6ddf57a4 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CMAKE_VERSION_MAJOR = 3.9
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
> +CMAKE_VERSION_MAJOR = 3.15
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> 
