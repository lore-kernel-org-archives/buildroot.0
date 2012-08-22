From: Luca Ceresoli <list@lucaceresoli.net>
Date: Wed, 22 Aug 2012 22:08:47 +0200
Subject: [Buildroot] [PATCH] inotify-tools: add license information
In-Reply-To: <20120822215832.12e58fe5@skate>
References: <1345619321-4644-1-git-send-email-spdawson@gmail.com>
 <20120822194521.48a4060c@skate> <503538F7.9000102@lucaceresoli.net>
 <20120822215832.12e58fe5@skate>
Message-ID: <50353C4F.50800@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Le Wed, 22 Aug 2012 21:54:31 +0200,
> Luca Ceresoli <luca@lucaceresoli.net> a ?crit :
>
>>> I've applied your patch with GPLv2+, and we'll listen to comments from
>>> others if they have a better idea on how to take the proper decision on
>>> this.
>>
>> iostat has the same licensing policy.
>>
>> The GPLv2 (reported in the COPYING file for inotify-tools, as well as
>> iostat)
>> states:
>>
>>     If the Program does not specify a version number of
>>     this License, you may choose any version ever published by the Free
>> Software
>>     Foundation.
>>
>> So:
>> INOTIFY_TOOLS_LICENSE = GPL
>
> Even if the program includes a specific version of the GPL in its
> COPYING file (in this case GPLv2) ?

That's the file that contains the text I quoted, so I'd say yes.
I just sent a patch to fix this, but of course you should wait for other 
comments
before applying if you're in doubt.

Luca
