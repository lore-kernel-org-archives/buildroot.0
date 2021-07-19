From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Jul 2021 16:39:56 -0300
Subject: [Buildroot] [PATCH] board/mx6cubox: Switch to extlinux.conf
In-Reply-To: <CAB0FRsv3Wt=Hjon0FF+nqSh-HzNmsHbv8z12Cwbn+qK0N5DaSw@mail.gmail.com>
References: <20210718222449.3622228-1-festevam@gmail.com>
 <CAB0FRsv3Wt=Hjon0FF+nqSh-HzNmsHbv8z12Cwbn+qK0N5DaSw@mail.gmail.com>
Message-ID: <CAOMZO5DMf1TiOUuA4vASwOoYBYR+Lnyze-JWnJSYsgrCbH68JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Fran?ois,

On Mon, Jul 19, 2021 at 4:37 PM Fran?ois Perrad
<francois.perrad@gadz.org> wrote:

> Hello Fabio,
>
> with this new version, the boot is OK,

Thanks for testing.

> but there still an issue with the console variable:
> # cat /proc/cmdline
> root=PARTUUID=00000000-01 rootwait rw console=ttymxc0,115200,115200

Yes, I will fix this issue in mainline U-Boot too.

>> Is it safe to apply the U-Boot patch that changes the
>> mmc device for all cubox/hummingboard variants?
>>
>> If it is OK, then I will send it to U-Boot upstream.
>>
>
> I think that the patch must be upstreamed.

I will upstream it.

Thanks,

Fabio Estevam
