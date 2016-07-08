From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 8 Jul 2016 09:42:00 +0200
Subject: [Buildroot] [PATCH] tekui: relax dynamic library dependency
In-Reply-To: <20160707213240.378baea9@free-electrons.com>
References: <1467910890-16574-1-git-send-email-francois.perrad@gadz.org>
 <20160707213240.378baea9@free-electrons.com>
Message-ID: <CAB0FRstErD=FH8SJS13GdwV-+N_fc5VZU7hRkk98x6kGmz+eug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-07-07 21:32 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Thu,  7 Jul 2016 19:01:30 +0200, Francois Perrad wrote:
>> tekui doesn't really require these Lua modules.
>> These modules are added because they increase the user experience with demo/examples.
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Then perhaps there should be a sub-option to enable the demo/examples?
>

A sub-option "Demo" is usual in BR.
But with TekUI, the sub-option will be "Dependencies for Demo".
It sounds bad.

Fran?ois

> Thanks,
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
