From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 07 Aug 2014 10:46:47 +0100
Subject: [Buildroot] [PATCH V2] gdb: allow building on AArch64 systems
In-Reply-To: <20140806194603.3a56a5e5@free-electrons.com>
References: <1407314534-5536-1-git-send-email-alex.bennee@linaro.org>
 <20140806194603.3a56a5e5@free-electrons.com>
Message-ID: <87sil8k4sg.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Thomas Petazzoni writes:

> Dear Alex Benn?e,
>
> On Wed,  6 Aug 2014 09:42:14 +0100, Alex Benn?e wrote:
>> gdb has had AArch64 support since 7.6 which is now the default minimum
>> version of GDB in the tree. Older versions are now legacy.
>> 
>> Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
>
> Applied, thanks!

How are you applying the patches? I'm curious because while my local
patch shows up in the log with:

commit 0b729ce2baa9903e7d3520196f9fff16cdff24fa
Author: Alex Benn?e <alex.bennee@linaro.org>

The one in upstream is:

commit 4372449a4f8e16f763c7d5a0c125ca015a7cbef6
Author: alex.bennee at linaro.org <alex.bennee@linaro.org>

I'd usually assume utf-8 shenanigans tripping something up but I see the
repo does have names with more accents than mine ;-)

>
> Thomas

-- 
Alex Benn?e
