From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 21 Oct 2014 10:53:47 +0200
Subject: [Buildroot] [PATCH 2/2 v5] package/mono: new package
In-Reply-To: <20141021103339.7beae145@free-electrons.com>
References: <54458B8C.4020505@crapouillou.net>
 <20141021103339.7beae145@free-electrons.com>
Message-ID: <CA+TH9VmR74=yuiq1JmPCO+tDxtYWgbY3Z6Fg=TFoXx_zw_ve0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Paul

2014-10-21 10:33 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Paul Cercueil,
>
> On Tue, 21 Oct 2014 00:24:12 +0200, Paul Cercueil wrote:
>
>> Your package does not work here, host-mono fails to build.
>> I attached the log file.
>>
>> Could the DLL files be downloaded instead of rebuilt? They should be
>> arch-independent, so it may be easier and faster to just download them.
>> Then only the runtime would need to be built.
>
> Which DLL are you talking about? host-monolite already downloads a
> bunch of pre-built DLLs.

DLLs are the ones produced by host-mono. They are cross platform and
of cource you can copy it from you local mono installation.
By the way, they are developed in tandem with mono, and fixed with it,
so if you want to build the library outside mono, you should be sure
to base it on the same mono version.

Downloading a precompiled bundle is entirely possible, but it's not
upstreamed in any way. From my information, there is no way to have a
precompiled and signed mono runtime distribution to download.

Sincerly, Angelo

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
