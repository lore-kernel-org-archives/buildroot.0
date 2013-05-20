From: Markos Chandras <markos.chandras@gmail.com>
Date: Mon, 20 May 2013 10:38:08 +0100
Subject: [Buildroot] [PATCH] pixman: Apply upstream patch to fix
 compilation on MIPS
In-Reply-To: <20130520093423.GG7188@tarshish>
References: <1369040459-17604-1-git-send-email-markos.chandras@gmail.com>
 <20130520092025.GF7188@tarshish>
 <CAG2jQ8j3fye2s1T3fXytsm+0L+dAz1i3dgOxmt7e2jb9jT22-g@mail.gmail.com>
 <20130520093423.GG7188@tarshish>
Message-ID: <CAG2jQ8gUYi6ajsxD=uMJpporO1McdF8ub85D9+JEu4JD3qWUuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 20 May 2013 10:34, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Markos,
>
> On Mon, May 20, 2013 at 10:24:32AM +0100, Markos Chandras wrote:
>> >>  PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
>> >>  PIXMAN_LICENSE = MIT
>> >>  PIXMAN_LICENSE_FILES = COPYING
>> >>
>> >> +PIXMAN_AUTORECONF = YES
>> >
>> > Please add a comment explaining why this is needed.
>>
>> I thought it was obvious because the patch fixes the configure.ac
>> file. But ok, I will add a comment.
>
> I missed that. In this case a comment is not needed I guess, unless others
> have a different opinion.
>
> baruch
>

I sent v2. I didn't add a comment because I see that most of packages
do not explain with AUTORECONF is needed.

Thank you for your comments.

--
Regards,
Markos Chandras
