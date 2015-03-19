From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 19 Mar 2015 09:35:31 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <1426708866.1395.8.camel@embedded.rocks>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
Message-ID: <CA+TH9VmRWPdidNHSLArTek4Pxxtw+viOy7_tMbMYturnq0-VaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

I think think we have two major problems in Buildroot backlog management imho.

The first on is the impossibility to prioritize patches to be
reviewed. Nobody really cares to go to months old threads only to find
an important patch passed unobserved. We should have a way to tag that
patch as high/low priority just at the time of arrival, so reviewers
could choose in a pool of important patches. This way the project
could add important features and bug fixes more easily.
To me, it's not that important that my new shiny sysdig package will
enter buildroot in a couple of major releases, it's more important to
have the makedevs recursive option applied cause it's really a killer
feature (this is only an example from my backlog).

The second one is to have the ability to comment patches directly on
web. Nobody wants to dig his email client looking for that two months
old thread to be reviewed. Having a simple way to comment on web could
accelerate patch review considerably, cause I can filter patches
matching a certain criteria and review them one by one. I can choose
to review patches from older to younger, or patches that pertain to my
field of knowledge.

My two cents.

Sincerely, Angelo.

2015-03-18 21:01 GMT+01:00 J?rg Krause <joerg.krause@embedded.rocks>:
> Dear Thomas,
>
> On Mi, 2015-03-04 at 23:21 +0100, Thomas Petazzoni wrote:
>> Hello,
>>
>> If you're worried about patches not being merged, or taking too long to
>> get merged, here is a quick statistic I made.
>>
>> On http://patchwork.ozlabs.org/project/buildroot/list/, on a total of
>> 356 pending patches at the time of my testing, only 22 patches had a
>> Acked-by, Reviewed-by or Tested-by tag. All of the other 334 patches
>> have not been given any of these tags.
>>
>> If you would like to help getting patches merged more quickly, then
>> please help by reviewing and testing patches!
>
> Are there any guidelines for reviewing? It's a pitty that GSoC did not
> accepted Buildroot this year. The testing scripts would be a nice
> feature.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
