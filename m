From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 11:07:17 +0100
Subject: [Buildroot] [PATCH 32/33] rrdtool: add license info
In-Reply-To: <20121122051744.GA10958@sapphire.tkos.co.il>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-33-git-send-email-s.martin49@gmail.com>
 <20121122051744.GA10958@sapphire.tkos.co.il>
Message-ID: <CAHXCMM+pc8K8BUG7TcVBr5Q+-LYy2KLFNSgs7vkPTsOhLsVptA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

2012/11/22 Baruch Siach <baruch@tkos.co.il>:
> Hi Samuel,
>
> On Thu, Nov 22, 2012 at 01:18:22AM +0100, Samuel Martin wrote:
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/rrdtool/rrdtool.mk | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
>> index 8799a85..4392b50 100644
>> --- a/package/rrdtool/rrdtool.mk
>> +++ b/package/rrdtool/rrdtool.mk
>> @@ -6,6 +6,9 @@
>>
>>  RRDTOOL_VERSION = 1.2.30
>>  RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
>> +RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
>> +RRDTOOL_LICENSE_FILES = COPYING
>
> Shouldn't COPYRIGHT also be listed with the license files?
The Copyright file just tells us "wrt the license, you can do that and
that, but not that with this software",
with some real use case.

Shall we consider as part of the license files?

Regards,


-- 
Sam
