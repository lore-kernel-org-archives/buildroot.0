From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 19 Apr 2015 12:12:13 +0200
Subject: [Buildroot] [PATCH 3/3] expect: bump to version 5.45.3
In-Reply-To: <20150419081148.GC4313@free.fr>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
 <1429376067-9228-4-git-send-email-fabio.porcedda@gmail.com>
 <20150419081148.GC4313@free.fr>
Message-ID: <CAHkwnC_X6OCfau4QcN1=rvF7VV3vXHg1pYcYUutBD9m6qkoqVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 19, 2015 at 10:11 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2015-04-18 18:54 +0200, Fabio Porcedda spake thusly:
>> Download it from the cvs repository because it is not avaialbe as a
>> downloadable file.
>> Also because a tag isn't avaiable use the date.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  package/expect/expect.hash | 2 --
>>  package/expect/expect.mk   | 5 ++---
>>  2 files changed, 2 insertions(+), 5 deletions(-)
>>  delete mode 100644 package/expect/expect.hash
>>
>> diff --git a/package/expect/expect.hash b/package/expect/expect.hash
>> deleted file mode 100644
>> index 09e68e7..0000000
>> --- a/package/expect/expect.hash
>> +++ /dev/null
>> @@ -1,2 +0,0 @@
>> -# Locally computed:
>> -sha256  b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040  expect5.45.tar.gz
>> diff --git a/package/expect/expect.mk b/package/expect/expect.mk
>> index 8ef7e90..513be8f 100644
>> --- a/package/expect/expect.mk
>> +++ b/package/expect/expect.mk
>> @@ -4,9 +4,8 @@
>>  #
>>  ################################################################################
>>
>> -EXPECT_VERSION = 5.45
>> -EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
>> -EXPECT_SITE = http://downloads.sourceforge.net/project/expect/Expect/$(EXPECT_VERSION)
>> +EXPECT_VERSION = 2014/05/02 # v5.45.3
>
> Do not put comments after the variable definition, it breaks things.

Could you explain it?

> Note that the example we have in the manual is wrong. Care to address
> that as well, please?

Sure

Thanks for reviewing.
-- 
Fabio Porcedda
