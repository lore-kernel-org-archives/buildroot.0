From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 19 Sep 2014 09:27:15 +0200 (CEST)
Subject: [Buildroot] [PATCH] cmake : bump to version 3.0.2
In-Reply-To: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <791659592.25467604.1411111635391.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please do not apply

I just realized I did not remove a patch that was commited upstream, 

I will resubmit soon (after proper testing)

Cordialement 

J?r?my Rosen 
+33 (0)1 42 68 28 04

fight key loggers : write some perl using vim 


Open Wide Ingenierie

23, rue Daviel
75013 Paris - France
www.openwide.fr





----- Mail original -----
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
>  package/cmake/cmake.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index bfeb147..e09fddf 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CMAKE_VERSION_MAJOR = 2.8
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).12.2
> +CMAKE_VERSION_MAJOR = 3.0
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
>  CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3c
>  CMAKE_LICENSE_FILES = Copyright.txt
> --
> 2.1.0
> 
> 
