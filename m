From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 8 Jun 2018 09:13:17 -0300 (BRT)
Subject: [Buildroot] [PATCH 1/1] whois: bump to version 5.3.1
In-Reply-To: <CAPi7W80Qe4Vf32874iDi499OUXrmVcmgcYGjKrz3b300cO_nig@mail.gmail.com>
References: <20180606193903.3245-1-fontaine.fabrice@gmail.com>
 <1206209474.1824932.1528459021636.JavaMail.zimbra@datacom.com.br>
 <CAPi7W80Qe4Vf32874iDi499OUXrmVcmgcYGjKrz3b300cO_nig@mail.gmail.com>
Message-ID: <181904012.1831567.1528459997870.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Friday, June 8, 2018 9:02:48 AM
> Subject: Re: [Buildroot] [PATCH 1/1] whois: bump to version 5.3.1

> Dear Carlos,

> 2018-06-08 13:57 GMT+02:00 Carlos Santos < [ mailto:casantos@datacom.com.br |
> casantos at datacom.com.br ] > :

>>> From: "Fabrice Fontaine" < [ mailto:fontaine.fabrice@gmail.com |
>> > fontaine.fabrice at gmail.com ] >
>> > To: "buildroot" < [ mailto:buildroot at buildroot.org | buildroot@buildroot.org ] >
>>> Cc: "Fabrice Fontaine" < [ mailto:fontaine.fabrice@gmail.com |
>> > fontaine.fabrice at gmail.com ] >
>> > Sent: Wednesday, June 6, 2018 4:39:03 PM
>> > Subject: [Buildroot] [PATCH 1/1] whois: bump to version 5.3.1

>> [...]
>> > +WHOIS_VERSION = 5.3.1
>>> +WHOIS_SITE = [
>>> http://snapshot.debian.org/archive/debian/20180522T155750Z/pool/main/w/whois |
>> > http://snapshot.debian.org/archive/debian/20180522T155750Z/pool/main/w/whois ]

>> Just out of curiosity, why not [ https://github.com/rfc1036/whois/releases |
>> https://github.com/rfc1036/whois/releases ] ?

> I perfectly understand your curiosity, you can find some answers here:
> - [ https://patchwork.ozlabs.org/patch/801032 |
> https://patchwork.ozlabs.org/patch/801032 ]
> - [ https://patchwork.ozlabs.org/patch/801033 |
> https://patchwork.ozlabs.org/patch/801033 ]

Huh, it's even worst: I just noticed that the tarball name at GitHub
is "v5.3.1.tar.gz", leading to the same situation we faced before in

    https://patchwork.ozlabs.org/patch/849230/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
