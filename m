From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 19:35:24 +0200
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
In-Reply-To: <7d24aa70-74c4-1166-e69f-5d8c7a5c6875@mind.be>
References: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
 <7d24aa70-74c4-1166-e69f-5d8c7a5c6875@mind.be>
Message-ID: <a7969129-6272-575d-0846-1874629cebc4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Gaah, I hit send too soon...

On 02/06/2021 19:34, Arnout Vandecappelle wrote:
> 
> 
> On 27/05/2021 14:50, Baruch Siach wrote:
>> The original site is gone.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/8d4a2ef5a7f50ea21b844d6cf806bb83016ae17b/
>>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
>  Applied to master, thanks.
> 
>  Regards,
>  Arnout
> 
>> ---
>>  package/netperf/netperf.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
>> index 8b2280830f3c..0c423249c4c9 100644
>> --- a/package/netperf/netperf.mk
>> +++ b/package/netperf/netperf.mk
>> @@ -5,7 +5,7 @@
>>  ################################################################################
>>  
>>  NETPERF_VERSION = 2.7.0
>> -NETPERF_SITE = ftp://ftp.netperf.org/netperf
>> +NETPERF_SITE = http://sources.buildroot.net/netperf

 We prefer buildroot.org over buildroot.net nowadays, so I changed that.

 Regards,
 Arnout

>>  NETPERF_SOURCE = netperf-$(NETPERF_VERSION).tar.bz2
>>  # gcc 5+ defaults to gnu99 which breaks netperf
>>  NETPERF_CONF_ENV = \
>>
