From: Andreas Naumann <dev@andin.de>
Date: Mon, 19 Dec 2016 10:13:29 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <20161217154629.09d3f0e3@free-electrons.com>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161217154629.09d3f0e3@free-electrons.com>
Message-ID: <3e4baa3d-e4cf-0a3f-6508-f68f87012812@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 17.12.2016 um 15:46 schrieb Thomas Petazzoni:
> Hello,
>
> On Tue, 13 Dec 2016 15:59:24 +0100, Andreas Naumann wrote:
>
>> Andreas Naumann (4):
>>   qt5: Remove all hashes
>>   qt5: bump to 5.8.0-rc
>>   qt5declarative: enable Quick for non-GL platforms
>>   qt5quickcontrols1/2: enable for software renderer
>>
>> Julien Corjon (3):
>>   qt5enginio : move into legacy compatibility
>>   qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
>>   Revert "qt5base: install bundled fonts to target"
>
> I've marked the set of patches as "Changes Requested" in our patch
> tracking system. Can you resubmit when a "fixed" -rc release of Qt 5.8
> is published?
>
> Also, you had a few comments during the review, if you could take them
> into account, it would be nice.

I'll try to fix yours and Peters issues/comments today. In the meanwhile 
Qt updated their planned -rc release for tomorrow, 20th December. So I 
guess I'll wait for that to happen, update the hashes also and provide a 
v4 wednesday or so.

On the question of supporting two versions: For the moment I lack the 
time and a good idea of how to do it without duplicating lots of code.

Regards,
Andreas

>
> Thanks a lot!
>
> Thomas
>
