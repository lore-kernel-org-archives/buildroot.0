From: Omar BELKHODJA <omar.belkhodja@gmail.com>
Date: Mon, 29 Dec 2008 12:20:16 +0100
Subject: [Buildroot] [PATCH] Buildroot uClibc-0.9.29 patches not	present
 in uClibc-0.9.30
In-Reply-To: <20081229110937.GB8275@mx.loc>
References: <1229806548.30378.10.camel@linux-yrgm.site>
	<495801C7.7090807@gmail.com> <87vdt34e1y.fsf@macbook.be.48ers.dk>
	<4958AB8B.2070005@gmail.com> <20081229110937.GB8275@mx.loc>
Message-ID: <4958B270.80709@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the inconvenience. I guess this happened because I did a 
copy/paste... What I wanted to say was :

It is already disabled... So this option seems not to be working. Below 
is an extract of my .config file (I needs locales that's why they are 
enabled).
Also, if I try with

BR2_ENABLE_LOCALE_PREGENERATED=n

It still doesn't work


Regards,
Omar

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
BR2_UCLIBC_VERSION_0_9_30=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
UCLIBC_VERSION="0.9.30"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PREGENERATED is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
BR2_PTHREAD_DEBUG=y
BR2_UCLIBC_PROGRAM_INVOCATION=y
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

Bernhard Reutner-Fischer a ?crit :
> On Mon, Dec 29, 2008 at 11:50:51AM +0100, Omar BELKHODJA wrote:
>   
>> <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
>> <html>
>> <head>
>>  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
>>  <title></title>
>> </head>
>> <body bgcolor="#ffffff" text="#000000">
>> <tt>It is already disabled... So this option seems not to be working.
>> Below is an extract of my .config file (I needs locales that's why they
>> are enabled).<br>
>>     
>
> brrrrr. Please send plaintext messages, TIA
>
>   

-- 
Omar BELKHODJA
_______________________________________________________________________
   _____  ____   _____    _____
  / ____|/ __ \ / ____|  / ____|
 | (___ | |  | | (___   | |     ___  _ __ ___  _ __   __ _ _ __  _   _
  \___ \| |  | |\___ \  | |    / _ \| '_ ` _ \| '_ \ / _` | '_ \| | | |
  ____) | |__| |____) | | |___| (_) | | | | | | |_) | (_| | | | | |_| |
 |_____/ \____/|_____/   \_____\___/|_| |_| |_| .__/ \__,_|_| |_|\__, |
                                              | |                 __/ |
                                              |_|                |___/
    __                    __               __
   (  '_    /_   _   _/  /  )_ '_ '  _ /  (    / _/'     _
  __)///)/)((-  (//)(/  (__// /(///)(/(  __)()((///()/)_)
        /                     _/
  http://www.sos-company.com
_______________________________________________________________________
