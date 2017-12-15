From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 15:38:30 +0000
Subject: [Buildroot] FW: iqvlinux: bump to version 1.2.0.3
In-Reply-To: <1656135717.6146859.1513352279730.JavaMail.zimbra@datacom.ind.br>
References: <20171215134800.29328-1-casantos@datacom.ind.br>
 <ba544a7a-7575-3af6-0955-d126b3c40aca@smile.fr>,
 <1656135717.6146859.1513352279730.JavaMail.zimbra@datacom.ind.br>
Message-ID: <d96373b109784aeca0d528456a97cfcc@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensCarlos Santos
Verzonden: vrijdag 15 december 2017 16:37:59 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: Romain Naour
CC: Romain Naour; buildroot at buildroot.org
Onderwerp: Re: [Buildroot] [PATCH 1/2] iqvlinux: bump to version 1.2.0.3

> From: "Romain Naour" <romain.naour@smile.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "Romain Naour" <romain.naour@gmail.com>
> Sent: Friday, December 15, 2017 12:09:34 PM
> Subject: Re: [Buildroot] [PATCH 1/2] iqvlinux: bump to version 1.2.0.3

[...]

>> diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
>> index ddf57b712c..11195f1d71 100644
>> --- a/package/iqvlinux/iqvlinux.hash
>> +++ b/package/iqvlinux/iqvlinux.hash
>> @@ -1,5 +1,6 @@
>> -# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
>> -sha1        bd94416e4364015dbbd78a22e51080bf7ea81fac        iqvlinux.tar.gz
>> -md5 fb6a2a4dc122d39070fcb06985c97a05        iqvlinux.tar.gz
>>  # locally computed
>> -sha256      8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec
>>      iqvlinux.tar.gz
>> +sha256      4020a661940ba6d50f24654b90a41280eb8eccf00061fe6d105c654d3d97d551
>> iqvlinux.tar.gz
>
> Actually this package is really annoying since the archive name doesn't contain
> the version.
>
> Buildroot still use the 1.1.5.3 version in his autobuilders (for stable branch)
> and the new archive will replace the old one in the dl directory.
>
> I'm not sure if we can rename the archive after downloading...
>
> Best regards,
> Romain

We can use a pre-download hook.

--
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent
success of having your words and actions judged by your reputation,
rather than the other way about.? ? Christopher Hitchens
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
