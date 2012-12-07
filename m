From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 7 Dec 2012 06:36:04 -0500
Subject: [Buildroot] [PATCH] fix cjson package
In-Reply-To: <50C1ABA9.2030202@syscom-instruments.com>
References: <50C0B73C.9020407@syscom-instruments.com>
 <CANxTyt4OZM0u3jyGrDoAQPvBSzVQ_=BHz_c0rNW6Y9pSr1jzbQ@mail.gmail.com>
 <50C1ABA9.2030202@syscom-instruments.com>
Message-ID: <CANxTyt5w28z3o7zU8AMH+G02nY2ysir7rMiwKUkWP1Lfmm0_wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 7, 2012 at 3:41 AM, Viallard Anthony
<viallard@syscom-instruments.com> wrote:
> And i know now what is the actual issue. Here the good big fix :
>
> ---
>  package/cjson/cjson.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
> index ccc6010..55af800 100644
> --- a/package/cjson/cjson.mk
> +++ b/package/cjson/cjson.mk
> @@ -5,7 +5,7 @@
>  #############################################################
>  CJSON_VERSION         = undefined
>  CJSON_SOURCE          = cJSONFiles.zip
> -CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/
> +CJSON_SITE            = http://downloads.sourceforge.net/project/cjson
>
>  CJSON_INSTALL_STAGING = YES
>  CJSON_LICENSE         = MIT
>
> --
> 1.7.10.4

I'm not sure if Peter needs you to send the good fix as a
git-send-email'ed V2, but:

Acked-by: Danomi Manchego <danomimanchego123@gmail.com>
