From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2019 11:24:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.15.5
In-Reply-To: <20191101214052.19167-1-bernd.kuhls@t-online.de>
References: <20191101214052.19167-1-bernd.kuhls@t-online.de>
Message-ID: <20191102102425.GA2710@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2019-11-01 22:40 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://blog.kitware.com/cmake-3-15-5-available-for-download/

Thanks for the poitner to the release notes.

Although I understand we usually want to update, the release notes for
this version only list one fix to an example file, and fixes for VS
(Visual Studio, thus Windows) and Xcode (thus MacOS). So, nothing that
applies to Linux, and to us.

I don't think we want updates just for the sake of having updates.
Bumping a package, especially one that can be considered part of the
core components, should bring something besides just bragging about
"up-to-date".

(but I see Thomas already applied it.)

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index bbf6e19f27..983c292983 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.15/cmake-3.15.4-SHA-256.txt
> -sha256 8a211589ea21374e49b25fc1fc170e2d5c7462b795f1b29c84dd0e984301ed7a  cmake-3.15.4.tar.gz
> +# From https://cmake.org/files/v3.15/cmake-3.15.5-SHA-256.txt
> +sha256 fbdd7cef15c0ced06bb13024bfda0ecc0dedbcaaaa6b8a5d368c75255243beb4  cmake-3.15.5.tar.gz
>  
>  # Locally calculated
>  sha256 dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 7c6ddf57a4..1f30736023 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  CMAKE_VERSION_MAJOR = 3.15
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
