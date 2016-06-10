From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Jun 2016 06:57:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: enable video
	support
References: <1461445358-32052-1-git-send-email-bernd.kuhls@t-online.de>
 <20160610003503.7ebe8f20@free-electrons.com>
 <20160609223914.GB17968@free.fr>
Message-ID: <dvtp2dx1c8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas, all,

Am Fri, 10 Jun 2016 00:39:14 +0200 schrieb Yann E. MORIN:

> Bernd, Thomas, All,
> 
> On 2016-06-10 00:35 +0200, Thomas Petazzoni spake thusly:
>> 
>> Have you tried replacing this complicated stuff with just:
>> 
>>    FREESWITCH_MAKE_ENV += CROSS=$(TARGET_CROSS)

yes, it seems to work, thx. I will sent v3 in a few minutes.

> Alternatively, can't we jsut revert that upstream patch you pinted to:
>     https://freeswitch.org/fisheye/changelog/freeswitch?cs=febe0f8dacea2d2a31902b3dc469be757f8c3c4d

I doubt that from upstream pov this will make sense.

> Hopefully, they are not stubborn, and will listen if we come up with
> good arguments... ;-)

http://article.gmane.org/gmane.comp.telephony.freeswitch.user/83701

"Note we are in process of moving this library in tree static to not
 use system libs along with vpx due to needs to have much newer
 versions changing at a much higher rate than system packages."

Regards, Bernd
