From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 6 Feb 2015 16:31:33 +0100
Subject: [Buildroot] [PATCH] mono: add patch to fix MIPS build issue
In-Reply-To: <20150206162157.7041b7ac@free-electrons.com>
References: <1423233944-1722-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150206162157.7041b7ac@free-electrons.com>
Message-ID: <CA+TH9VmHH6B8WeKO7mcshXCZu0ZHBHPoh49jN6RaCYB1DXCQug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you very much for solving this, I had no time to look at the
issue. A really big thanks!

Sincerely, Angelo

2015-02-06 16:21 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri,  6 Feb 2015 15:45:44 +0100, Thomas Petazzoni wrote:
>> Since the bump to version 3.12 of Mono, it fails to build on MIPS. The
>> patch added by this commit fixes this build failure, simply caused by
>> a missing include.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.org/results/6f5/6f5e20a4a99eb0db650430bf6285c844fd940711/
>>
>> Submitted upstream at https://github.com/mono/mono/pull/1550.
>
> The patch has been merged upstream.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
