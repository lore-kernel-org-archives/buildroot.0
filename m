From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 31 Mar 2017 23:07:05 +0530
Subject: [Buildroot] [PATCH 15/21] freeswitch: use SPDX short identifier
	for license strings
In-Reply-To: <859ce539-de85-64e6-6b04-d1e3ffb04d29@mind.be>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
 <1490881430-10434-16-git-send-email-rahulbedarkar89@gmail.com>
 <859ce539-de85-64e6-6b04-d1e3ffb04d29@mind.be>
Message-ID: <CA+NV+VmNSMEJPabtnceeZuU5Na3X84m=GpvJwjFp4Q8hF0K-sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Mar 31, 2017 at 3:49 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 30-03-17 15:43, Rahul Bedarkar wrote:
>> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
>
>  Quick comment on this one...
>
>  First of all, I think it's a very good idea to have first the fully automatic
> patches, and then do remaining fixups like this one.
>
>  However, I think there is still a lot more to be fixed up. There are also
> plenty of places where we refer to (L)GPLv[23] in e.g. comments. So instead of
> this patch, I would add a series of patches that uses the same (or maybe
> slightly more generic) sed expressions but now doesn't limit to _LICENSE or to
> .mk files. I did a quick check, there are about 25 instances of GPLv left, but
> you need to filter out patches and _LICENSE_FILES, so perhaps an automatic sed
> expression is going to be difficult.
>
>  Anyway, my message is: those 25 remaining instances should be replaced as well.

I was not sure if license strings in comments should be updated to use
SPDX identifier.
May be for consistency it should be ? But it doesn't harm either, so I
will fix those
separately with this one.

Thanks,
Rahul
