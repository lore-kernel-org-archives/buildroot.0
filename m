From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Thu, 22 Nov 2012 13:35:57 +0100
Subject: [Buildroot] [PATCH v3 1/6] snowball-hdmiservice: new package
In-Reply-To: <50AC79F3.6000807@mind.be>
References: <1352967920-3164-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352967920-3164-2-git-send-email-gregory.hermant@calao-systems.com>
 <50AC79F3.6000807@mind.be>
Message-ID: <50AE1C2D.8010905@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,
Le 21/11/2012 07:51, Arnout Vandecappelle a ?crit :
> On 15/11/12 09:25, Gregory Hermant wrote:
>>
>> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
> [snip]
>> +
>> +define SNOWBALL_HDMISERVICE_BUILD_CMDS
>> +    $(MAKE) CC="$(TARGET_CC)" -C $(@D)
>> +endef
>
>  I may have asked this before, but is there a reason to not pass buildroot's
> CFLAGS and LDFLAGS?  We usually pass $(TARGET_CONFIGURE_OPTS) to sub-makes.
>
> [snip]
>
The build of the hdmiservice.so fails if i pass the buildroot's LDFLAGS.

>  Regards,
>  Arnout
>
BR,
gregory
