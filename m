From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Jul 2018 21:55:36 +0200
Subject: [Buildroot] [PATCH v3 10/22] package/x11r7/xkeyboard-config:
 switch to xorgproto
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-11-bernd.kuhls@t-online.de>
 <20180702214801.GP2604@scaer>
Message-ID: <omcn1fx702.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Mon, 02 Jul 2018 23:48:01 +0200 schrieb Yann E. MORIN:

>> --- a/package/x11r7/xkeyboard-config/Config.in
>> +++ b/package/x11r7/xkeyboard-config/Config.in
>> @@ -3,7 +3,7 @@ config BR2_PACKAGE_XKEYBOARD_CONFIG
>>  	# Runtime dependencies
>>  	select BR2_PACKAGE_XAPP_XKBCOMP if BR2_PACKAGE_XORG7
>>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>> -	select BR2_PACKAGE_XPROTO_XPROTO if BR2_PACKAGE_XORG7
>> +	select BR2_PACKAGE_XORGPROTO if BR2_PACKAGE_XORG7
> 
> I'm always a bit warry about dependencies selected, that are not in the
> .mk. Is it missing there?

Afaics they are not missing in the.mk file because these packages are 
marked as runtime dependencies in Config.in.

Regards, Bernd
