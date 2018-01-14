From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 14 Jan 2018 19:56:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
In-Reply-To: <uagqiexfnk.ln2@ID-313208.user.individual.net>
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
 <uagqiexfnk.ln2@ID-313208.user.individual.net>
Message-ID: <6b37de5d-dd14-17a8-44a8-bd9b078c2920@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd


Bernd Kuhls kirjoitti 14.01.2018 klo 01:11:
> Am Sun, 14 Jan 2018 00:26:51 +0200 schrieb Stefan Fr?berg:
>
>> Unbound: validating, recursive & caching DNS resolver with
>> DNSSEC, QNAME minimisation, DNSCrypt and DNS-over-TLS support.
>>
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Hi,
>
> when testing your package with this defconfig stored in ./test-unbound
>
> $ cat ./test-unbound 
> BR2_PACKAGE_UNBOUND=y
> BR2_PACKAGE_UNBOUND_DNSCRYPT=y
>
> $ utils/test-pkg -c test-unbound $HOME/test-unbound
>
> it fails on some platforms:
>
>                    br-arm-cortex-m4-full [ 8/47]: FAILED
>                       br-arm-full-static [11/47]: FAILED
>                             br-bfin-full [12/47]: FAILED
>                        br-m68k-5208-full [15/47]: FAILED
>
> I stopped the test at this point, maybe you can have a look at the 
> failures? I did not do that at this time (CET) of day ;)
>

Uh...47 compiler/platform combinations? Jeeez...that will take ages with
my poor comp ...

Where does that test-pkg script output the build failures?

Regards
Stefan
?
