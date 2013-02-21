From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 22 Feb 2013 01:32:54 +0200
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5126AC9B.30302@mind.be>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com> <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
 <5126A8C7.2000009@petroprogram.com> <5126AC9B.30302@mind.be>
Message-ID: <5126AEA6.7060004@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[snip]
>>>   I'm afraid that mdev and udev no longer work with old kernels that
>>> don't support the DEVTMPFS option...
>>>
>>>   mdev and udev don't create device nodes; they only do something
>>> configurable when a hotplug event happens.
>>>
>>
>> What you mean that mdev or udev does not create device nodes ???
>> If older kernels don't support devtmpfs like Baruch
>> said then who does that device node creation if not the mdev or udev
>> when event happens ???
>
>  Well, nobody...
>
>  Turns out that mdev still does device node creation. Makes me wonder
> if I'm not mistaken about udev as well... I just remember hearing that
> device node creation was removed when DEVTMPFS was introduced.
>

Speaking of udev, I must say that Im not very happy of that recent
including of systemd as hard dependency.
If it would be optional then it would be ok and fine, but to forcefully
cram yet-another init system (in addition to bazillion other existing ones)
down the throats of latest udev users .... not good, not good at all!

Also, what I have studied little of those Gnome3 software packages,
there also seems to spreading this systemd thing.



Stefan
