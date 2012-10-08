From: ludovic.desroches <ludovic.desroches@atmel.com>
Date: Mon, 8 Oct 2012 09:23:50 +0200
Subject: [Buildroot] [PATCH] fb-test-app: new package
In-Reply-To: <506F69C8.2010907@mind.be>
References: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
 <506F69C8.2010907@mind.be>
Message-ID: <50727F86.5050101@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

Le 10/06/2012 01:14 AM, Arnout Vandecappelle a ?crit :
> On 05/10/12 15:31, ludovic.desroches at atmel.com wrote:
>> From: Ludovic Desroches<ludovic.desroches@atmel.com>
>
> Add a Signed-off-by line for yourself.  This is a short way for you to
> assert that you are entitled to contribute the patch under buildroot's
> GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt for more
> details.

Sorry for the omission.

>
> [snip]
>> diff --git a/package/fb-test-app/Config.in
>> b/package/fb-test-app/Config.in
>> new file mode 100644
>> index 0000000..6b682ce
>> --- /dev/null
>> +++ b/package/fb-test-app/Config.in
>> @@ -0,0 +1,4 @@
>> +config BR2_PACKAGE_FB_TEST_APP
>> +    bool "fb-test-app"
>> +    help
>> +      Test suite for Linux framebuffer.
>
>   Could you add an upstream URL to the help text?
>

Yes I'll add the github url.

>> diff --git a/package/fb-test-app/fb-test-app.mk
>> b/package/fb-test-app/fb-test-app.mk
>> new file mode 100644
>> index 0000000..ce31f05
>> --- /dev/null
>> +++ b/package/fb-test-app/fb-test-app.mk
>> @@ -0,0 +1,34 @@
>> +#############################################################
>> +#
>> +# fb-test-app
>> +#
>> +#############################################################
>> +
>> +FB_TEST_APP_VERSION = v1.0.0
>> +FB_TEST_APP_SITE = git://github.com/prpplague/fb-test-app.git
>
> FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball
>
>   downloads a lot faster.

Ok I'll change it.

Regards

Ludovic

>
>   Otherwise, looks great.
>
>
>   Regards,
>   Arnout
>
> [snip]
>
>
