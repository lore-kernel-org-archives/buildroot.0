From: W.P. <laurentp@wp.pl>
Date: Fri, 04 Mar 2011 23:39:19 +0100
Subject: [Buildroot] [OT?] Re:  Applying custom kernel patches
In-Reply-To: <518665.81144.qm@web161818.mail.bf1.yahoo.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<518665.81144.qm@web161818.mail.bf1.yahoo.com>
Message-ID: <4D716A17.1040008@wp.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U?ytkownik Steve Calfee napisa?:
>> From: bruce bushby <bruce.bushby@gmail.com>
>>     
>
>   
>> I've tried placing my patches in:
>> /opt/buildroot/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
>>
>>
>> I also tried putting them in
>> /opt/buildroot/package/linux/kernel-patches/0001-linux-2.6.38-rc5.patch
>>
>>     
> Hi,
>
> You may have a path problem for your patches. The path should be given in your 
> *_defconfig. 
>
>
> And buildroot will automatically apply patches at the appropriate time if they 
> are named in the form linux*patch. See the makefile.
>
> so 0001-linux-2.6.38-rc5.patch should be linux-001-2.6.38-rc5.patch
>
> Regards, Steve
>
>   
Could someone write a HOWTO?
I mean:
step 0): "I have kernel.xxx.yy.zzz directory unpacked AND a set of
patches (that applies correctly from kernel root) patch.00xx.patch"
step 1): where should I put (link?) kernel source?,
step 2): where should I put patches?.
step 3): how do I inform buildroot about patches?

W.P.
>
>       
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>   
