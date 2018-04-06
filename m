From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Apr 2018 12:45:41 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2018-03-16
In-Reply-To: <1522860238-29448-1-git-send-email-nerv@dawncrow.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Wed, 4 Apr 2018 18:43:58 +0200")
References: <1522860238-29448-1-git-send-email-nerv@dawncrow.de>
Message-ID: <878ta0liju.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

 > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Committed, thanks.

> ---
 >  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
 > index 18c3e24..504929a 100644
 > --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
 > +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -AZURE_IOT_SDK_C_VERSION = 2017-06-30
 > +AZURE_IOT_SDK_C_VERSION = 2018-03-16
 >  AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 >  AZURE_IOT_SDK_C_SITE_METHOD = git
 >  AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
 > -- 
 > 2.7.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
