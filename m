From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 09 Mar 2012 17:00:31 +0100
Subject: [Buildroot] [RFC v2 19/31] bzip2: define license
In-Reply-To: <201203072252.46180.yann.morin.1998@free.fr>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-20-git-send-email-luca@lucaceresoli.net>
 <201203072252.46180.yann.morin.1998@free.fr>
Message-ID: <4F5A291F.1020101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
> On Wednesday 07 March 2012 21:58:19 Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>> ---
>>   package/bzip2/bzip2.mk |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
>> index 1bc4449..028c2f2 100644
>> --- a/package/bzip2/bzip2.mk
>> +++ b/package/bzip2/bzip2.mk
>> @@ -7,6 +7,8 @@ BZIP2_VERSION:=1.0.5
>>   BZIP2_SONAME=1.0.4
>>   BZIP2_SOURCE:=bzip2-$(BZIP2_VERSION).tar.gz
>>   BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VERSION)
>> +BZIP2_LICENSE = BSD-like
> I think it makes sense to have:
>
>    value         meaning
>    -------------------------------
>    BSD-4c        Original BSD 4-clause
>    BSD           Alias for the above
>    BSD-3c        BSD 3-clause
>    BSD-2c        BSD 2-clause

You're right, I've been a bit lazy about BSD licenses, as I don't know in
detail all the variants. As I was mostly taking care of the core implementation
I skipped that part. I promise I'll do this homework next time. :-)

BTW, 4-clause BSD-like licenses have each a different copyright notice on
top (take for example the bzip2 license). Are them still *Original* BSD
4-clause licenses?
I think they are usually considered as such, which is ok according to common
sense, but is this correct from a strict legal point of view?
Does anybody has a precise knowledge or a trustworthy link to an answer?

Luca
