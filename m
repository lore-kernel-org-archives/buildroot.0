From: Valentine Barshak <gvaxon@gmail.com>
Date: Thu, 27 Sep 2012 22:09:10 +0400
Subject: [Buildroot] [PATCH 3/3] mplayer: Fix external libdvdread and
 libdvdnav support
In-Reply-To: <20120927143757.389ba7f2@skate>
References: <20120926193155.GA3942@gmail.com>
 <20120926193451.GA3983@gmail.com> <20120926224604.2cb082f2@skate>
 <50636C68.5030601@gmail.com> <506445C0.7010906@gmail.com>
 <20120927143757.389ba7f2@skate>
Message-ID: <50649646.9080205@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/2012 04:37 PM, Thomas Petazzoni wrote:
> Dear Valentine Barshak,
>
> On Thu, 27 Sep 2012 16:25:36 +0400, Valentine Barshak wrote:
>
>> Same here. I don't think disabling dvdnav would give us anything.
>>
>> Why not let mplayer try other choices (like internal dvd libs)
>> and auto-disable dvd support if the checks fail.
>>
>> Thomas, I can add this options if you like, but really don't see any
>> gain in them.
>
> The thing is that we generally try to avoid auto-detection, because
> many configure script misdetect libraries installed on the build
> machine as being usable for the target. I.e if to check whether
> libdvdnav is present it looks in /usr/include/dvdnav/something.h, then
> it might incorrectly conclude that libdvdnav is available.

Thanks for the explanations, Thomas.
I'll submit updated patches in a bit.

Thanks,
Val.
>
> Best regards,
>
> Thomas
>
