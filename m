From: Peter Rosin <peda@lysator.liu.se>
Date: Sun, 15 Nov 2015 08:43:50 +0100
Subject: [Buildroot] [PATCH 2/2] libtirpc: bump to version 1.0.1
In-Reply-To: <20151108143716.31f5c8cd@free-electrons.com>
References: <1446712210-14129-1-git-send-email-peda@lysator.liu.se>
 <1446712210-14129-3-git-send-email-peda@lysator.liu.se>
 <CA+BsyQ7XEwj_dLa=H6Yt+rWQMh3rOvH7Bhr=BfWNNkMmVbfnuw@mail.gmail.com>
 <20151108143716.31f5c8cd@free-electrons.com>
Message-ID: <564837B6.60209@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-11-08 14:37, Thomas Petazzoni wrote:
> Dear Brendan Heading,
>
> On Sun, 8 Nov 2015 13:30:45 +0000, Brendan Heading wrote:
>
>> FYI the new 1.0.1 version of libtirpc contains my patch to remove the
>> calls to atomic operations that were causing a lot of autobuild
>> failures on SPARC (and probably some other lesser-used arches too).
>> Took a bit of negotiation to get the patch into a form they were happy
>> to accept, but we got there in the end.
>>
>> So when the bump to 1.0.1 goes in we can expect this class of
>> autobuild issues to go away.
> Excellent, thanks a lot for working on this topic!

Hi!

What are we waiting for anyway? Anything I can do to move this along?

I thought I had straightened out all question marks?

Cheers,
Peter
