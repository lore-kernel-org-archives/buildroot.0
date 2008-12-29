From: Omar BELKHODJA <omar.belkhodja@gmail.com>
Date: Mon, 29 Dec 2008 16:07:33 +0100
Subject: [Buildroot] [PATCH] Buildroot uClibc-0.9.29 patches not	present
 in uClibc-0.9.30
In-Reply-To: <878wpz3w15.fsf@macbook.be.48ers.dk>
References: <1229806548.30378.10.camel@linux-yrgm.site>	<495801C7.7090807@gmail.com>
	<87vdt34e1y.fsf@macbook.be.48ers.dk>	<4958AB8B.2070005@gmail.com>
	<20081229110937.GB8275@mx.loc>	<4958B270.80709@gmail.com>
	<878wpz3w15.fsf@macbook.be.48ers.dk>
Message-ID: <4958E7B5.5090100@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your intereset to my issue guys. I appreciate it.

I've just update to the revision 24597, done a make distclean(by the way 
this didn't remove the .config file, so I removed it manually). Then I 
changed the configuration options using make menuconfig.

Please find attached, the command line + my .config file

Omar

Peter Korsgaard a ?crit :
>>>>>> "Omar" == Omar BELKHODJA <omar.belkhodja@gmail.com> writes:
>>>>>>             
>
> Hi,
>
>  Omar> It is already disabled... So this option seems not to be
>  Omar> working. Below is an extract of my .config file (I needs locales
>  Omar> that's why they are enabled).
>  Omar> Also, if I try with
>
>  Omar> BR2_ENABLE_LOCALE_PREGENERATED=n
>
>  Omar> It still doesn't work
>
> Strange, it works here, could you send the full .config please?
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



-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: log.txt
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20081229/05652312/attachment.txt 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20081229/05652312/attachment.diff 
