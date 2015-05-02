From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 12:21:54 +0200
Subject: [Buildroot] [PATCH 3/4] expect: bump to version 5.45.3
In-Reply-To: <1430091621-4698-4-git-send-email-fabio.porcedda@gmail.com>
References: <1430091621-4698-1-git-send-email-fabio.porcedda@gmail.com>
 <1430091621-4698-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5544A542.6030108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/04/15 01:40, Fabio Porcedda wrote:
> Download it from the cvs repository because it is not avaialbe as a
                                                        available

> downloadable file.
> Also because a tag isn't avaiable use the date.
                           available

> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Note that this can be applied without patch 1/3.

 Regards,
 Arnout

> ---
>  package/expect/expect.hash | 2 --
>  package/expect/expect.mk   | 6 +++---
>  2 files changed, 3 insertions(+), 5 deletions(-)
>  delete mode 100644 package/expect/expect.hash
> 
> diff --git a/package/expect/expect.hash b/package/expect/expect.hash
> deleted file mode 100644
> index 09e68e7..0000000
> --- a/package/expect/expect.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally computed:
> -sha256  b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040  expect5.45.tar.gz
> diff --git a/package/expect/expect.mk b/package/expect/expect.mk
> index 8ef7e90..d78ff6c 100644
> --- a/package/expect/expect.mk
> +++ b/package/expect/expect.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -EXPECT_VERSION = 5.45
> -EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
> -EXPECT_SITE = http://downloads.sourceforge.net/project/expect/Expect/$(EXPECT_VERSION)
> +# Version 5.45.3
> +EXPECT_VERSION = 2014-05-02
> +EXPECT_SITE = cvs://expect.cvs.sourceforge.net:/cvsroot/expect
>  EXPECT_LICENSE = Public domain
>  EXPECT_LICENSE_FILES = README
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
