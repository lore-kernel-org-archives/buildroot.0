From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 20:23:33 +0200
Subject: [Buildroot] New Package: Entware
In-Reply-To: <50885bb4-64a7-e6bc-36e2-ac468050df3a@mind.be>
References: <CALtfCQZa9OH-LFC12DtAV=3Ff9wMphcLhBmNyeRqmym7BsFAJw@mail.gmail.com>
 <50885bb4-64a7-e6bc-36e2-ac468050df3a@mind.be>
Message-ID: <bf8f0cba-e376-d800-df1f-8b44581a2f4c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/04/2019 20:22, Arnout Vandecappelle wrote:
> 
> 
> On 14/04/2019 15:19, Oscar Gomez Fuente wrote:
>> Hi everyone,
>>
>>
>> I was thinking about if it would be a good idea to develop a new
>> package to include the option to include Entware:
>> https://github.com/Entware/Entware/wiki.
> 
>  That's a collection of binary packages built for openwrt and using opkg to
> install... And to make sure it doesn't run into libc problems, it downloads and
> installs its own libc and puts that in /opt/lib, and all executables use that
> one as INTERP.
> 
>  So yes, I guess you could make a package that downloads those binaries and
> installs them in /opt, and makes sure that /opt/etc/init.d/rc.unslung is called
> at boot time. I kind of fail to see the point though.

 Let me clarify that: if you want to use OpenWrt packages on a Buildroot-built
system, why do you use Buildroot to build your system anyway? Just use OpenWrt...

 Regards,
 Arnout

> 
>  Regards,
>  Arnout
> 
>>
>> It seems to be it is a good alternative to ipkg/opkg which is very old fashion
>>
>> What do you think?
>>
>>
>> Oscar Gomez Fuente
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
