From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 5 Feb 2017 09:52:00 +0100
Subject: [Buildroot] [PATCH 1/1] docs/website: Feed API and gmane fix
In-Reply-To: <20170204235131.7332d861@free-electrons.com>
References: <1486247694-7324-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170204235131.7332d861@free-electrons.com>
Message-ID: <CA+TH9VkC93CiJefDnUM6NxLpMGQYZCes5e6F3BySnyaK+YkxdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2017-02-04 23:51 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat,  4 Feb 2017 23:34:54 +0100, Angelo Compagnucci wrote:
>> * Google retired feed API, this patch changes in favour of
>>   yahoo yql for rss to json conversion
>> * Gmane is gone, replacing it with nabble.
>> * Removed the import for feed api libraries
>> * Updates to the latest jquery version
>> * Reorganized javascript code in buildroot.js to accomodate
>>   the mentioned fixings
>
> This bullet list is a very good indication that this patch should be
> split into several smaller patches. It's doing lots of things that are
> fairly independent, or if not independent, that can be split into
> several steps.

Honestly, I cannot see your point here. I really cannot understand why
I should submit a patch that fixes the gogole feed API but leaves the
site broken because gmane is out of service. The rest of things are
functional to these fixings, so again cannot be splitted.
This patch makes the minimal set of changes to fix the currently
broken website. If not interested, please discard it.

Sincerely, Angelo.

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
