From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 20:52:10 -0300
Subject: [Buildroot] [PATCH 2/5] boost: add host variant
In-Reply-To: <526AFCE0.5050606@mind.be>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-2-git-send-email-gustavo@zacarias.com.ar>
 <526AFCE0.5050606@mind.be>
Message-ID: <526B042A.7030307@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/25/2013 08:21 PM, Arnout Vandecappelle wrote:

> On 25/10/13 14:15, Gustavo Zacarias wrote:
> [snip]
>> @@ -95,3 +127,4 @@ define BOOST_INSTALL_STAGING_CMDS
>>   endef
>>
>>   $(eval $(generic-package))
>> +$(eval $(host-autotools-package))
> 
>  Wow, did it suddenly become an autotools package? :-)

Damn copy/paste!
For all intents and purposes it works since all the important steps are
redefined.
I'll sent a v2 tomorrow after seeing if there's anything else to touch
in the other patches.
Regards.
