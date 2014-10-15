From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 15:16:53 +0200
Subject: [Buildroot] [PATCH 1/8] package/mpd: bump to version 0.19
In-Reply-To: <20141015105316.GL3500@tarshish>
References: <1413369564-22124-1-git-send-email-jkrause@posteo.de>
 <20141015105316.GL3500@tarshish>
Message-ID: <543E73C5.8090505@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 10/15/2014 12:53 PM, Baruch Siach wrote:
> Hi J?rg,
>
> On Wed, Oct 15, 2014 at 12:39:17PM +0200, J?rg Krause wrote:
>> * Bump to version 0.19
>> * Add boost as dependency
>> * Add support for libicu
>>
>> Signed-off-by: J?rg Krause <jkrause@posteo.de>
>> ---
>>   package/mpd/Config.in |  3 ++-
>>   package/mpd/mpd.mk    | 14 +++++++++++---
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
>> index 8884464..cd7bbfd 100644
>> --- a/package/mpd/Config.in
>> +++ b/package/mpd/Config.in
>> @@ -1,6 +1,7 @@
>>   menuconfig BR2_PACKAGE_MPD
>>   	bool "mpd"
>>   	depends on BR2_INSTALL_LIBSTDCPP
>> +	depends on BR2_LARGEFILE # boost
> You also need to add 'select BR2_PACKAGE_BOOST' to make sure boost gets built.

Oops! Something went wrong here. I'll fix it. Thanks for the review!
