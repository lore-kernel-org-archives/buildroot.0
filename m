From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 10:24:32 +0100
Subject: [Buildroot] [PATCH] pixman: Apply upstream patch to fix
 compilation on MIPS
In-Reply-To: <20130520092025.GF7188@tarshish>
References: <1369040459-17604-1-git-send-email-markos.chandras@gmail.com>
 <20130520092025.GF7188@tarshish>
Message-ID: <CAG2jQ8j3fye2s1T3fXytsm+0L+dAz1i3dgOxmt7e2jb9jT22-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

>
> We now usually omit version numbers from bundled patches file names.
Oh sorry I didn't notice. I will fix it.

>
>> -PIXMAN_VERSION = 0.28.2
>> +PIXMAN_VERSION = 0.30.0
>
> This is a version bump. The commit log should change accordingly.
Yes, I sent a follow-up e-mail explaining this was an accident. The
version bump is already present the -next branch.

>
>>  PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
>>  PIXMAN_LICENSE = MIT
>>  PIXMAN_LICENSE_FILES = COPYING
>>
>> +PIXMAN_AUTORECONF = YES
>
> Please add a comment explaining why this is needed.

I thought it was obvious because the patch fixes the configure.ac
file. But ok, I will add a comment.

Thanks for the review.
