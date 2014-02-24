From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 24 Feb 2014 11:10:03 +0100
Subject: [Buildroot] Call for autobuild fixing for 2014.02
In-Reply-To: <CAAXf6LVUxGrMkdjVfhjRPhkn0T4YwpzM20stvD3yfL7XdoHJJQ@mail.gmail.com>
References: <CAAXf6LUeXhtUXqjg0eJ845bF2eMd7WBXC_e5AAN0PUa3=svDTg@mail.gmail.com>
 <CAAXf6LVUxGrMkdjVfhjRPhkn0T4YwpzM20stvD3yfL7XdoHJJQ@mail.gmail.com>
Message-ID: <CAAXf6LV1FQ9NH1rqLS2usaYSczRrsDK3ccVDs51Ovmet7D4p3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 19, 2014 at 3:49 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
> On Fri, Feb 7, 2014 at 9:02 AM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> All,
>>
>> At the end of this month, buildroot-2014.02 will be released. In accordance
>> with our standard 3-month release cycle, this last month is all about
>> stabilization: bug fixing, autobuild fixing, etc.
>>
>> Last release cycle (2013.11) several developers put an increased effort in the
>> last month for this stabilization, and it has definitely made a great impact.
>> The number of autobuild failures significantly decreased during this time. This
>> release, we can even do better!
>> Looking at the current statistics, we are having 50-60% succeeding autobuilds,
>> which we should certainly increase towards 70-80%!
>>
>> Therefore, I would like to request all developers to temporarily stop creating
>> new features, adding new packages, etc. during the rest of this month, and
>> focus entirely on fixing autobuild problems (or other problems) instead.
>>
>> There are several ways in which you can help: - Send brief analysis mails based
>> on the autobuild results (sent daily by Thomas Petazzoni). This analysis mails
>> typically contain for each reported failure: a copy/paste of the relevant part
>> of the build log, and optionally a suggested resolution. These mails help other
>> developers in selecting a problem they will fix, and avoids duplicate effort.
>>
>> - Fixing actual autobuild problems. To fix a problem, you would start by
>> downloading the defconfig from the autobuild site, apply it in a fresh
>> repository, probably set a good value for BR2_DL_DIR, and run 'make' to see if
>> you can reproduce the problem. Once you can reproduce it, you can analyze in
>> more detail and create a fix.  Depending on the problem, you can attempt some
>> shortcuts. For example instead of building everything, you can request to build
>> one particular package (foo) by running 'make toolchain foo'. If the problem is
>> caused only by the overall configuration and foo itself (not by a missing
>> dependency) this faster build would also show the problem. Remember: it's
>> crucial that you can first reproduce the problem (with or without shortcut).
>> Otherwise you may 'fix' something that is not broken.  If you want to fix a
>> particular problem but get stuck, don't hesitate in sending your findings to
>> the list. Other developers can try to help you.
>>
>> - Testing fixes sent by other developers. This involves similar steps as fixing
>> the problem itself: first verify that you can reproduce the problem, then apply
>> the fix and verify that the problem is gone. If all this is successful, then
>> please respond on the fix with a Tested-by: tag.  This will help the maintainer
>> in knowing which patches to apply.
>>
>> - Analyzing and if needed fixing bug reports. Open buildroot bugs are at:
>> https://bugs.busybox.net/buglist.cgi?bug_status=__open__&content=&product=buildroot&query_format=specific&order=bug_id%20DESC&query_based_on=
>>
>
> Since the beginning of this month, the success rate of the autobuilds
> have steadily increased, currently around 75-85%.
> See statistics at http://autobuild.buildroot.org/stats.php
> Thanks to all who have been submitting autobuild fixes, and made
> analyses of the results!
>
> But, let's not stop here, let's go for 90%! I really think this is
> possible, we have more than a week to go...

Today we are at 90%! We should be able to keep this consistently or
even do better!
One more (small) week, 10% to go!

Thanks to all who are making this possible!

Best regards,
Thomas
