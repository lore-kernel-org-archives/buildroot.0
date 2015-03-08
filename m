From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 8 Mar 2015 15:53:11 +0100
Subject: [Buildroot] [RFC v3 21/30] lmbench: to be checked
In-Reply-To: <20150303165607.GR15668@tarshish>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <1425374255-6827-22-git-send-email-fabio.porcedda@gmail.com>
 <20150303165607.GR15668@tarshish>
Message-ID: <CAHkwnC-v4MCD5OjWz4VgJvseoJyRREfpeufg5v6SjENpQ3YZKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 3, 2015 at 5:56 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Tue, Mar 03, 2015 at 10:17:26AM +0100, Fabio Porcedda wrote:
>> ---
>>  package/lmbench/lmbench.mk | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
>> index 63a83fd..954f7eb 100644
>> --- a/package/lmbench/lmbench.mk
>> +++ b/package/lmbench/lmbench.mk
>> @@ -10,9 +10,6 @@ LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbe
>>  LMBENCH_LICENSE = lmbench license (based on GPLv2)
>>  LMBENCH_LICENSE_FILES = COPYING COPYING-2
>>
>> -LMBENCH_CFLAGS = $(TARGET_CFLAGS)
>> -LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
>> -
>
> Please see http://patchwork.ozlabs.org/patch/442832/.

I will rebase this patch over your patch.

Thanks

BR
-- 
Fabio Porcedda
