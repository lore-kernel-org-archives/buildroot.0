From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Tue, 10 Nov 2015 23:05:49 +0900
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-11-06
In-Reply-To: <43B1D209-3DB5-49EF-8F92-4A8442109C7F@ca2.so-net.ne.jp>
References: <20151107073016.DCC83100931@stock.ovh.net>
 <f0p5hcxm2q.ln2@ID-313208.user.individual.net>
 <43B1D209-3DB5-49EF-8F92-4A8442109C7F@ca2.so-net.ne.jp>
Message-ID: <37C867D2-EDB8-42AB-B65D-3E23C585E83B@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I?ve checked.

Sorry, this patch is already incorporated to current gauche source.
So it will not be cause.

Regards, Kawashima

> 2015/11/10 22:53?Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp> ?????
> 
> Dear Bernd.
> 
> Thank you for your suggestion.
> I also think it will fix this (sh4, powerpc, arm, ?).
> 
> I will send patch later.
> 
>> 2015/11/09 14:53?Bernd Kuhls <bernd.kuhls@t-online.de> ?????
>> 
>> Am Sat, 07 Nov 2015 08:30:16 +0100 schrieb Thomas Petazzoni:
>> 
>>>        arm |                   gauche-0.9.4 | NOK |
>>>        http://autobuild.buildroot.net/
>> results/43abe584b53995097d81e8e75a900fd9f09e1961/
>> 
>> Hi,
>> 
>> I could not reproduce the build error but I think this upstream commit 
>> should fix it: https://github.com/shirok/Gauche/
>> commit/625ca6201271e68aac53dbd532d3f17fecd9c4cb
>> 
>> Regards, Bernd
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
