From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 May 2014 06:48:15 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: disable for avr32
In-Reply-To: <20140513094647.GB4096@tarshish>
References: <1399972577-10048-1-git-send-email-gustavo@zacarias.com.ar>
 <20140513094647.GB4096@tarshish>
Message-ID: <5371EA5F.9080509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/13/2014 06:46 AM, Baruch Siach wrote:

>> diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
>> index dcd2ec5..1ef2b6b 100644
>> --- a/package/btrfs-progs/Config.in
>> +++ b/package/btrfs-progs/Config.in
>> @@ -4,6 +4,7 @@ config BR2_PACKAGE_BTRFS_PROGS
>>  	depends on BR2_USE_WCHAR # util-linux
>>  	depends on BR2_USE_MMU # util-linux
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on !BR2_avr32 # toolchain issues
> 
> Please update the dependencies comment as well.

Hi.
Thomas has direct git-brain wiring, he already told so ;)
Regards.
