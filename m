From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon, 12 Nov 2012 22:17:39 +0100
Subject: [Buildroot] QT packackage grantlee not building
In-Reply-To: <5ECF3E39D913490AB1D4F8AF7FA3450B@JohanW7>
References: <28814AE91EA94801B84C55B81555379F@JohanW7>
 <509D7A48.4030002@mind.be> <50A0130C.4020402@gmail.com>
 <5ECF3E39D913490AB1D4F8AF7FA3450B@JohanW7>
Message-ID: <50A16773.6020400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2012 11:26 PM, Sagaert Johan wrote:
> Hi
>
>   I included my config
>
> Regards , Johan
>
>
>
> -----Oorspronkelijk bericht-----
> Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Zoltan Gyarmati
> Verzonden: zondag 11 november 2012 22:05
> Aan: buildroot at busybox.net
> Onderwerp: Re: [Buildroot] QT packackage grantlee not building
>
> Hi,
>
> going to check it as soon a spossible, a defconfig would be useful indeed.
> Thx for the report!
>
> BR,
> Zoltan Gyarmati
>
>
>
> On 11/09/2012 10:48 PM, Arnout Vandecappelle wrote:
>> On 11/09/12 22:44, Sagaert Johan wrote:
>>> Currently the build of the QT grantlee package is broken:
>>> it seems like libpthread is not linked in.
>>   Could you post a defconfig so we can try to reproduce?
>>
>>   Regards,
>>   Arnout
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Hi,

i just managed to reproduce the issue, i'll send a patch to fix it, thx

-- 
br,
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
