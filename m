From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 23 Feb 2013 13:18:26 +0200
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <51288C46.2030001@mind.be>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com> <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
 <5126A8C7.2000009@petroprogram.com> <5126AC9B.30302@mind.be>
 <5126AEA6.7060004@petroprogram.com> <51288C46.2030001@mind.be>
Message-ID: <5128A582.8070802@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.2.2013 11:30, Arnout Vandecappelle kirjoitti:
> On 22/02/13 00:32, Stefan Fr?berg wrote:
>> Speaking of udev, I must say that Im not very happy of that recent
>> including of systemd as hard dependency.
>> If it would be optional then it would be ok and fine, but to forcefully
>> cram yet-another init system (in addition to bazillion other existing
>> ones)
>> down the throats of latest udev users .... not good, not good at all!
>
>  If I understand correctly, you can still build udev without systemd,
> they're just packaged together. They have added a somewhat
> hard-to-avoid dependency on dbus, though.
>

It can? Hmmm... have to check it again. I think Gentoo folks have
avoided that dbus thing and they even forked lately udev -> eudev.
And that eudev does not need need /usr to be mounted before it starts.

>  But then, why would you want udev to begin with? mdev can do
> everything that udev can, no?
>

True.
mdev should be able to do everything that udev does. 
Maybe even run scripts when mdev detect plugin event from kernel (not
sure, have not checked).
 
But what really annoys me is that some newer Gnome packages include udev
as hard dependency.
So I end up installing udev anyway even if I would have just liked to
use simple mdev.

>  Regards,
>  Arnout
>
