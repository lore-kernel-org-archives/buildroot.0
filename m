From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 2 Mar 2018 15:14:53 +0100
Subject: [Buildroot] [PATCH] mono: only available for x86/x86-64 host
 architectures
In-Reply-To: <20180302142714.564bb9c7@windsurf.lan>
References: <20180302074929.21404-1-peter@korsgaard.com>
 <20180302142714.564bb9c7@windsurf.lan>
Message-ID: <CA+TH9VkcVmyuus2pGMgY6_S+6qtWBw_Teba1jzQtiME6MJdSzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-03-02 14:27 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Fri,  2 Mar 2018 08:49:29 +0100, Peter Korsgaard wrote:
>> Fixes:
>>
>> http://autobuild.buildroot.net/results/3cab7b54390feb5f952407f1e7fa49b9633a5f76/
>> http://autobuild.buildroot.net/results/ad9fc1f8a598d2c1ee7e6f8884f897f7b8bbb657/
>>
>> And many others.
>>
>> Mono needs host-mono, which fails to build on the ppc64le autobuilder.
>> There is unlikely to be any real use cases of people building mono on !x86,
>> so only make it available on x86/x86-64 hosts, similar to how it was
>> recently done for erlang.
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
