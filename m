From: Belisko Marek <marek.belisko@gmail.com>
Date: Fri, 23 Mar 2012 10:32:32 +0100
Subject: [Buildroot] ofono package
In-Reply-To: <4F6C4272.6070405@visionsystems.de>
References: <CAAfyv35Rq_ad_obvHC2QZdhBvebLqpsRO7G0B4qpkGZuEYamuA@mail.gmail.com>
 <CAGm1_ks7QkKyFS7wWPMi3ytu4d2QU=k=gVEcnq6ENoA-CM3sKQ@mail.gmail.com>
 <20120323101100.5fa94c86@skate> <20120323102058.3a159cc4@skate>
 <4F6C4272.6070405@visionsystems.de>
Message-ID: <CAAfyv34uTzeUsnqyyO09GXC7VeWDy9_7oU7nn6rEviu9nwTkhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 23, 2012 at 10:29 AM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
> Am 23.03.2012 10:20, schrieb Thomas Petazzoni:
>> Le Fri, 23 Mar 2012 10:11:00 +0100,
>> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>>
>>> If this bootstrap stuff is used to regenerate the configure script and
>>> Makefile.am, then use OFONO_AUTORECONF=YES.
>>
>> Looking at the package source code, setting OFONO_AUTORECONF=YES should
>> be sufficient. Just remove your OFONO_CONFIGURE_CMDS and see if it
>> works.
>
> It works, but I found one more dependency, that is not in BR yet: http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders#Checkout.2BAC8-Clone
>
> http://git.gnome.org/browse/mobile-broadband-provider-info/
>
> Marek: could you add this package?
Yes of course. Will send updated patch. What about bluez?
Just use bluez_utils or keep libbluez?
>
> Yegor

marek



-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
