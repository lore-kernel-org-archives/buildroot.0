From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Jul 2018 21:56:46 +0200
Subject: [Buildroot] [PATCH v3 07/22] package/x11r7/xapp_*: mass switch
 to xorgproto
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-8-bernd.kuhls@t-online.de>
 <20180702213506.GM2604@scaer>
Message-ID: <uocn1fx702.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Mon, 02 Jul 2018 23:35:06 +0200 schrieb Yann E. MORIN:

>> --- a/package/x11r7/xapp_mkfontscale/Config.in
>> +++ b/package/x11r7/xapp_mkfontscale/Config.in
>> @@ -3,5 +3,6 @@ config BR2_PACKAGE_XAPP_MKFONTSCALE
>>  	select BR2_PACKAGE_FREETYPE
>>  	select BR2_PACKAGE_XLIB_LIBX11
>>  	select BR2_PACKAGE_XLIB_LIBFONTENC
>> +	select BR2_PACKAGE_XORGPROTO
> 
> So, xapp_mkfontscale did select no xproto, and now it selects all...
[...]
>> -XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
>> +XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xorgproto
[...]
> 
> ... because it was a missing dependency.
> 
> So it should have been in a separate patch, so that the fix stands out.

sent http://patchwork.ozlabs.org/patch/943794/

Regards, Bernd
