From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 20 Apr 2015 11:00:42 +0200
Subject: [Buildroot] [PATCH] live555: fix library installation
In-Reply-To: <20150420105613.7c8262d3@free-electrons.com>
References: <1429195850-4884-1-git-send-email-luca@lucaceresoli.net>	<20150419134235.18c914b0@free-electrons.com>	<5534BAF3.1080305@lucaceresoli.net>
 <20150420105613.7c8262d3@free-electrons.com>
Message-ID: <5534C03A.5060204@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Mon, 20 Apr 2015 10:38:11 +0200, Luca Ceresoli wrote:
>

[...]

>> BTW, there should be a simple way to skip installation of all
>> executables, by tweaking the live555 makefiles. But I don't think it
>> would be very nice to conditionally apply a patch based on config
>> options. Do you agree?
>
> No, conditional patches are a no-go. This would only be possible if you
> had a patch that can always be applied, and then the .mk file calls
> "make install-all" or "make install-lib" or something like that. But if
> it's not planned in the live555 build system, I don't think it's really
> worth doing the change.

Sure, I never meant to make any such change in Buildroot. Instead, I'm
probably putting such an ugly patch on my local repo, as it's a very
simple way to save ~300 kB!

And BTW I don't think there's anything like that in the live555 plans.

-- 
Luca
