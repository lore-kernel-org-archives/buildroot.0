From: Martin Bark <martin@barkynet.com>
Date: Mon, 12 Oct 2015 12:32:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version to 2015g
In-Reply-To: <561B9594.3070604@imgtec.com>
References: <1444647391-22164-1-git-send-email-martin@barkynet.com>
 <561B9594.3070604@imgtec.com>
Message-ID: <CAFGQKxcfdWdzvGcwpg5r2gJM8uPYGz5pwDcHwCWuot-SsVRQ1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent,

On 12 October 2015 at 12:12, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Dear Martin Bark,
>
> thanks for your contributions. Below are some comments, please scroll down:
>
> On 10/12/2015 11:56 AM, Martin Bark wrote:
>> Signed-off-by: Martin Bark <martin@barkynet.com>
>> ---
>>  package/zic/zic.hash | 4 ++--
>>  package/zic/zic.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
>> index 67a6c6d..3014d02 100644
>> --- a/package/zic/zic.hash
>> +++ b/package/zic/zic.hash
>> @@ -1,2 +1,2 @@
>> -# From 2015f release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-August/000033.html
>> -sha512  5cfbebde8a0be57e8388a7b6d35aeba99130a72c1a41f9bbd5d5864511a473aa5e9320ab21055b4383e64b3b9d7682c0d30377ce8407619987be672436014710  tzcode2015f.tar.gz
>> +# From 2015g release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
>
> Perhaps we could change that comment to follow the Buildroot's way, like
> this:
>
> # From: http://mm.icann.org/pipermail/tz-announce/2015-October/000034.html
>
> The same applies to your patch for bumping tzdata version.

Ok will do

>
>> +sha512  44da833da3afdb82636a953785372bb4c765e61e40d700da40b46ab70007ebdbde4d480e10b87cbb36c45eaaffcaa6b9894375e2f553b7d16655dc167cd4a11f  tzcode2015g.tar.gz
>> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
>> index e4cc1d3..0bcb800 100644
>> --- a/package/zic/zic.mk
>> +++ b/package/zic/zic.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -ZIC_VERSION = 2015f
>> +ZIC_VERSION = 2015g
>>  ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>>  ZIC_SITE = ftp://ftp.iana.org/tz/releases
>
> The tarballs are also available from http, so better switching to it in
> order to prevent problems for people behind firewalls:
>
> ZIC_SITE = http://www.iana.org/time-zones/repository/releases
>
> The same applies to your patch for bumping tzdata version.

Good idea, I'll resubmit and include an additional patch to change to
the http download.

Thanks

Martin

>
> Regards,
>
> Vincent.
